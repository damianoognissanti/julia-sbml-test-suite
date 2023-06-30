# Model name: 00002_sbml_l2v4
# Number of parameters: 1
# Number of species: 1
function getODEModel_00002_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t X(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [X]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Cell 

    ### Store parameters in array for ODESystem command
    parameterArray = [Cell]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(X) ~ -1 * (0.1*X)+2.0 * (0.1*X)-1 * (0.11*X)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    X => 100.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    Cell => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
