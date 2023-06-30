# Model name: 00026_sbml_l2v5
# Number of parameters: 3
# Number of species: 3
function getODEModel_00026_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t Source(t) X(t) Sink(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [Source, X, Sink]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Cell Mu Alpha 

    ### Store parameters in array for ODESystem command
    parameterArray = [Cell, Mu, Alpha]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(Source) ~ 0.0,
    D(X) ~ +1 * (Alpha)-1 * (Mu*X),
    D(Sink) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    Source => 0.0,
    X => 0.0,
    Sink => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    Cell => nothing,
    Mu => 0.1,
    Alpha => 10.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
