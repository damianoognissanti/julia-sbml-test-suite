# Model name: 00612_sbml_l2v3
# Number of parameters: 2
# Number of species: 3
function getODEModel_00612_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C k 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, k]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /C ) * (((C*15000.0)*S1)*S2)+1 * ( 1 /C ) * ((C*5.0)*S3),
    D(S3) ~ +1 * ( 1 /C ) * (((C*15000.0)*S1)*S2)-1 * ( 1 /C ) * ((C*5.0)*S3),
    D(S2) ~ -1 * ( 1 /C ) * (((C*15000.0)*S1)*S2)+1 * ( 1 /C ) * ((C*5.0)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0e-5,
    S3 => 1.0e-5,
    S2 => 1.5000000000000002e-5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    k => 1.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
