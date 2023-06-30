# Model name: 00104_sbml_l2v1
# Number of parameters: 2
# Number of species: 3
function getODEModel_00104_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) C(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2, C]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p1 k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [p1, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /C ) * (C*(k1*S1)),
    D(S2) ~ +1 * ( 1 /C ) * (C*(k1*S1)),
    D(C) ~ (-1*C)*p1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.5,
    S2 => 0.0,
    C => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    p1 => 0.1,
    k1 => 0.9
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
