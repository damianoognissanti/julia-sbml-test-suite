# Model name: 01811_sbml_l1v2
# Number of parameters: 8
# Number of species: 0
function getODEModel_01811_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters AssignedName c Inf b INF inf a d 

    ### Store parameters in array for ODESystem command
    parameterArray = [AssignedName, c, Inf, b, INF, inf, a, d]

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
    AssignedName => nothing,
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
