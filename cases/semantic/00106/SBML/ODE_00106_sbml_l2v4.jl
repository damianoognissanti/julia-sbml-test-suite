# Model name: 00106_sbml_l2v4
# Number of parameters: 3
# Number of species: 5
function getODEModel_00106_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) C(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2, C]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p1 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [p1, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ +1 * ( 1 /C ) * (C*(k1*(S1*S2)))-1 * ( 1 /C ) * (((C*k2)*S3)*S4),
    D(S1) ~ -1 * ( 1 /C ) * (C*(k1*(S1*S2)))+1 * ( 1 /C ) * (((C*k2)*S3)*S4),
    D(S3) ~ +1 * ( 1 /C ) * (C*(k1*(S1*S2)))-1 * ( 1 /C ) * (((C*k2)*S3)*S4),
    D(S2) ~ -1 * ( 1 /C ) * (C*(k1*(S1*S2)))+1 * ( 1 /C ) * (((C*k2)*S3)*S4),
    D(C) ~ (-1*C)*p1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 1.0,
    S1 => 1.0,
    S3 => 2.0,
    S2 => 1.5,
    C => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    p1 => 0.1,
    k1 => 0.75,
    k2 => 0.25
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
