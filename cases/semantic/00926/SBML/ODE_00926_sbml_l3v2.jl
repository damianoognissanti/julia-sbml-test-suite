# Model name: 00926_sbml_l3v2
# Number of parameters: 0
# Number of species: 2
function getODEModel_00926_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t c(t) s(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [c, s]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters 

    ### Store parameters in array for ODESystem command
    parameterArray = [

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(c) ~ 0.5*c,
    D(s) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    c => 1.0,
    s => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
