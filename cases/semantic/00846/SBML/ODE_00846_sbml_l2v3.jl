# Model name: 00846_sbml_l2v3
# Number of parameters: 5
# Number of species: 4
function getODEModel_00846_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters kr kf C k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [kr, kf, C, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ +1 * ( 1 /C ) * (C*((k1*S3)+(-1*(k2*S4)))),
    D(S1) ~ -1 * ( 1 /C ) * (C*((kf*S1)+(-1*(kr*S2)))),
    D(S3) ~ -1 * ( 1 /C ) * (C*((k1*S3)+(-1*(k2*S4)))),
    D(S2) ~ +1 * ( 1 /C ) * (C*((kf*S1)+(-1*(kr*S2))))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 1.5,
    S1 => 1.0,
    S3 => 1.0,
    S2 => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    kr => 0.075,
    kf => 0.9,
    C => 1.0,
    k1 => 0.75,
    k2 => 0.15
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
