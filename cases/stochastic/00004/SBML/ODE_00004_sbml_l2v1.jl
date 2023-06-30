# Model name: 00004_sbml_l2v1
# Number of parameters: 3
# Number of species: 1
function getODEModel_00004_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t X(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [X]

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
    D(X) ~ -1 * (Lambda*X)+2.0 * (Lambda*X)-1 * (Mu*X)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    X => 10.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    Cell => nothing,
    Lambda => 0.1,
    Mu => 0.11
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
