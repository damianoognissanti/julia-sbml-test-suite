# Model name: 01810_sbml_l2v5
# Number of parameters: 3
# Number of species: 0
function getODEModel_01810_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Inf INF inf 

    ### Store parameters in array for ODESystem command
    parameterArray = [Inf, INF, inf]

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
    Inf => 1.0,
    INF => 10.0,
    inf => 0.1
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
