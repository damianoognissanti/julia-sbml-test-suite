# Model name: 01811_sbml_l2v4
# Number of parameters: 7
# Number of species: 0
function getODEModel_01811_sbml_l2v4()

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
    c => Inf,
    Inf => 1.0,
    b => Inf,
    INF => 10.0,
    inf => 0.1,
    a => Inf,
    d => Inf
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
