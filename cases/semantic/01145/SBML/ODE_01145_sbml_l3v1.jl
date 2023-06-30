# Model name: 01145_sbml_l3v1
# Number of parameters: 1
# Number of species: 0
function getODEModel_01145_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters extentconv 

    ### Store parameters in array for ODESystem command
    parameterArray = [extentconv]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [

    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [

    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    extentconv => 10.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
