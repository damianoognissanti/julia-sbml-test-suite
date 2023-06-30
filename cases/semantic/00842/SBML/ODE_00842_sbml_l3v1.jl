# Model name: 00842_sbml_l3v1
# Number of parameters: 3
# Number of species: 4
function getODEModel_00842_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters kr kf C 

    ### Store parameters in array for ODESystem command
    parameterArray = [kr, kf, C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ -0.5*S1,
    D(S1) ~ -1.0 * ( 1 /C ) * (C*((kf*S1)+(((-1*kr)*S2)*S3))),
    D(S3) ~ +1.0 * ( 1 /C ) * (C*((kf*S1)+(((-1*kr)*S2)*S3))),
    D(S2) ~ +1.0 * ( 1 /C ) * (C*((kf*S1)+(((-1*kr)*S2)*S3)))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.5,
    S1 => 1.0,
    S3 => 0.0,
    S2 => 0.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    kr => 0.2,
    kf => 2.5,
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
