# Model name: 00632_sbml_l2v3
# Number of parameters: 3
# Number of species: 2
function getODEModel_00632_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C p2 p1 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, p2, p1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /C ) * ((C*(multiply(p1, p2)))*S1),
    D(S2) ~ +1 * ( 1 /C ) * ((C*(multiply(p1, p2)))*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.13333333333333333*(multiply(p1, p2)),
    S2 => 0.15
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    p2 => 0.01,
    p1 => 75.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
