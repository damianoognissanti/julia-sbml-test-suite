# Model name: 00006_sbml_l3v1
# Number of parameters: 3
# Number of species: 2
function getODEModel_00006_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t X(t) Sink(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [X, Sink]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Cell Lambda Mu 

    ### Store parameters in array for ODESystem command
    parameterArray = [Cell, Lambda, Mu]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(X) ~ -1.0 * (Lambda*X)+2.0 * (Lambda*X)-1.0 * (Mu*X),
    D(Sink) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    X => 100.0,
    Sink => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    Cell => nothing,
    Lambda => 0.1,
    Mu => 0.11
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
