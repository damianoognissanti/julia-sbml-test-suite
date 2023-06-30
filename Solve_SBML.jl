using PEtab
using OrdinaryDiffEq
using RuntimeGeneratedFunctions
using ModelingToolkit
using Test
using CSV
using Logging

io = open("log.txt", "w+")
logger = SimpleLogger(io)
with_logger(logger) do
    @info("a context specific log message")
end
flush(io)
global_logger(logger)

read(run(`printf "\033c"`), String)

RuntimeGeneratedFunctions.init(@__MODULE__)

"""
    solveODEAtSBMLValues(petabModel, solver, timeSpan; abstol=1e-8, reltol=1e-8, saveat=Float64[], verbose=true)

Solve an ODE SBML model at the values reported in the SBML file over timeSpan=(t0::Float, tend::Float).

Solvers in OrdinaryDiffEq.jl are supported. In case you want to save the ODE solution at specific time-points, 
e.g [1.0, 3.0] provide saveat=[1.0, 3.0]. Output is provided in the OrdinaryDiffEq.jl format.

To access the ODE states simply call states(sol.prob.f.sys) (sol = ODE-solution)

**Note** - the Julia models files are saved in the same directory as the SBML file, in a subdirectory named SBML.
"""
function solveODEAtSBMLValues(pathSBML, solver, timeSpan; abstol=1e-8, reltol=1e-8, saveat::Vector{Float64}=Float64[], verbose::Bool=true)

    @assert isfile(pathSBML) "SBML file does not exist"

    verbose && @info "Building ODE system"
    modelName = splitdir(pathSBML)[2][1:end-4]
    modelName = replace(modelName, "-" => "_")
    #println(modelName)

    dirSave = joinpath(splitdir(pathSBML)[1], "SBML")
    if !isdir(dirSave)
        mkdir(dirSave)
    end
    pathODE = joinpath(dirSave, "ODE_" * modelName * ".jl")
    SBMLDict = PEtab.XmlToModellingToolkit(pathSBML, pathODE, modelName, ifElseToEvent=true)

    verbose && @info "Symbolically processing system"
    funAsString = PEtab.getFunctionsAsString(pathODE, 1)[1]
    #println(funAsString)
    #funAsString = replace(funAsString, Regex("ceiling\\((.*?)\\)")=>s"Int(ceil(\1).val)")
    #println(funAsString)
    _getODESystem = @RuntimeGeneratedFunction(Meta.parse(funAsString))
    _odeSystem, stateMap, parameterMap = _getODESystem("https://xkcd.com/303/") # Argument needed by @RuntimeGeneratedFunction
    odeSystem = structural_simplify(_odeSystem)

    # Build callback function 
    pODEProblemNames = string.(parameters(odeSystem))
    modelStateNames = replace.(string.(states(odeSystem)), "(t)" => "")

    stringWriteCallbacks = "function getCallbacks_" * modelName * "()\n"
    stringWriteTstops = "\nfunction computeTstops(u::AbstractVector, p::AbstractVector)\n"

    # In case we do not have any events
    verbose && @info "Building callbacks"
    if isempty(SBMLDict["boolVariables"]) && isempty(SBMLDict["events"])
        callbackNames = ""
        checkIfActivatedT0Names = ""
        stringWriteTstops *= "\t return Float64[]\nend\n"
    else
        for key in keys(SBMLDict["boolVariables"])
            functionsStr, callbackStr =  PEtab.createCallback(key, SBMLDict, pODEProblemNames, modelStateNames)
            stringWriteCallbacks *= functionsStr * "\n"
            stringWriteCallbacks *= callbackStr * "\n"
        end
        for key in keys(SBMLDict["events"])
            functionsStr, callbackStr = PEtab.createCallbackForEvent(key, SBMLDict, pODEProblemNames, modelStateNames)
            stringWriteCallbacks *= functionsStr * "\n"
            stringWriteCallbacks *= callbackStr * "\n"
        end

        _callbackNames = vcat([key for key in keys(SBMLDict["boolVariables"])], [key for key in keys(SBMLDict["events"])])
        callbackNames = prod(["cb_" * name * ", " for name in _callbackNames])[1:end-2]
        # Only relevant for picewise expressions 
        if !isempty(SBMLDict["boolVariables"])
            checkIfActivatedT0Names = prod(["isActiveAtTime0_" * key * "!, " for key in keys(SBMLDict["boolVariables"])])[1:end-2]
        else
            checkIfActivatedT0Names = ""
        end
        #println(stringWriteTstops)
        #stringWriteTstops *= "\treturn" * PEtab.createFuncionForTstops(SBMLDict, modelStateNames, pODEProblemNames, θ_indices) * "\n" * "end" * "\n"
        stringWriteTstops *= "\treturn Float64[] \nend \n"
    end
    convertTspan = false
    stringWriteCallbacks *= "\treturn CallbackSet(" * callbackNames * "), Function[" * checkIfActivatedT0Names * "], " * string(convertTspan)  * "\nend"
    fileWrite = dirSave * "/" * modelName * "_callbacks.jl"
    if isfile(fileWrite)
        rm(fileWrite)
    end
    io = open(fileWrite, "w")
    write(io, stringWriteCallbacks * "\n\n")
    write(io, stringWriteTstops)
    close(io)

    strGetCallbacks = PEtab.getFunctionsAsString(fileWrite, 2)
    getCallbackFunction = @RuntimeGeneratedFunction(Meta.parse(strGetCallbacks[1]))
    cbSet, checkCbActive, convertTspan = getCallbackFunction("https://xkcd.com/2694/") # Argument needed by @RuntimeGeneratedFunction
    computeTstops = @RuntimeGeneratedFunction(Meta.parse(strGetCallbacks[2]))

    verbose && @info "Solving ODE"

    odeProblem = ODEProblem(odeSystem, stateMap, timeSpan, parameterMap, jac=true)
    tStops = computeTstops(odeProblem.u0, odeProblem.p)
    for f! in checkCbActive
        f!(odeProblem.u0, odeProblem.p)
    end

    return solve(odeProblem, solver, abstol=abstol, reltol=reltol, saveat=saveat, tstops=tStops, callback=cbSet)
end


fileList = CSV.File("./cases/files.txt")

#@testset "Julia import" begin
    #badFiles = [
    #    "/semantic/00048/00048-sbml-l2v1.xml"
    #]
    for (index,file) in enumerate(fileList)
        pathSBML = file[1]
        strippedFileName = replace(pathSBML, "./cases"=>"")
        #if index > 370 && index < 372 && !maximum(strippedFileName .== badFiles)
            println(index)
            println(strippedFileName)
            println(io,index)
            println(io,strippedFileName)
            #println(sol isa ODESolution)
            #if index  ∉ badIndex
            sol = try solveODEAtSBMLValues(pathSBML, Rodas5P(), (0.0, 10.0))
            catch e
                io = IOBuffer();
                showerror(io, e)
                error_msg = String(take!(io))
                @warn "Trouble doing things:\n$(error_msg)"
            end
            #@test sol isa ODESolution
            #end
        #end
    end

#end
flush(io)
close(io)

