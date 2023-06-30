# Model name: 00663_sbml_l2v4
# Number of parameters: 4
# Number of species: 4
function getODEModel_00663_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k3 C k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [k3, C, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ +1 * ( 1 /C ) * ((C*k3)*S3),
    D(S1) ~ -1 * ( 1 /C ) * (((C*k1)*S1)*S2)+1 * ( 1 /C ) * ((C*k2)*S3)+1 * ( 1 /C ) * ((C*k3)*S3),
    D(S3) ~ +1 * ( 1 /C ) * (((C*k1)*S1)*S2)-1 * ( 1 /C ) * ((C*k2)*S3)-1 * ( 1 /C ) * ((C*k3)*S3),
    D(S2) ~ -1 * ( 1 /C ) * (((C*k1)*S1)*S2)+1 * ( 1 /C ) * ((C*k2)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.0,
    S1 => 0.002,
    S3 => 0.0,
    S2 => 0.002
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k3 => 0.7,
    C => 1.0,
    k1 => 1000.0,
    k2 => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
