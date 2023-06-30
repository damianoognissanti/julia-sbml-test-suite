# Model name: 01811_sbml_l2v1
# Number of parameters: 7
# Number of species: 0
function getODEModel_01811_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters c Inf b INF inf a d 

    ### Store parameters in array for ODESystem command
    parameterArray = [c, Inf, b, INF, inf, a, d]

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
    c => 0.1,
    Inf => 1.0,
    b => 1.0,
    INF => 10.0,
    inf => 0.1,
    a => 10.0,
    d => Inf
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
