# Model name: 01708_sbml_l2v4
# Number of parameters: 2
# Number of species: 1
function getODEModel_01708_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C P1 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, P1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 10.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 2.0,
    P1 => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
