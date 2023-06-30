# Model name: 00733_sbml_l2v5
# Number of parameters: 2
# Number of species: 4
function getODEModel_00733_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

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
    D(S4) ~ multiply(k, 1//250000),
    D(S1) ~ -1 * ( 1 /C ) * (((C*750000.0)*S1)*S2)+1 * ( 1 /C ) * ((C*0.3)*S3),
    D(S3) ~ +1 * ( 1 /C ) * (((C*750000.0)*S1)*S2)-1 * ( 1 /C ) * ((C*0.3)*S3),
    D(S2) ~ -1 * ( 1 /C ) * (((C*750000.0)*S1)*S2)+1 * ( 1 /C ) * ((C*0.3)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 1.0e-7,
    S1 => 1.5e-6,
    S3 => 1.5e-6,
    S2 => 2.0e-6
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    k => 0.25
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
