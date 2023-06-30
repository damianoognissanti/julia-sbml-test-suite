# Model name: 00898_sbml_l2v4
# Number of parameters: 3
# Number of species: 2
function getODEModel_00898_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C p1 k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, p1, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /C ) * (((C*k1)*S1)*t),
    D(S2) ~ +1 * ( 1 /C ) * (((C*k1)*S1)*t)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0015,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    p1 => 1.0,
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
