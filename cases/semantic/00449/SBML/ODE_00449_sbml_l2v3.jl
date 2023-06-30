# Model name: 00449_sbml_l2v3
# Number of parameters: 1
# Number of species: 4
function getODEModel_00449_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C 

    ### Store parameters in array for ODESystem command
    parameterArray = [C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ +1 * ( 1 /C ) * (((C*7500.0)*S1)*S2)-1 * ( 1 /C ) * (((C*2500.0)*S3)*S4),
    D(S1) ~ -1 * ( 1 /C ) * (((C*7500.0)*S1)*S2)+1 * ( 1 /C ) * (((C*2500.0)*S3)*S4),
    D(S3) ~ +1 * ( 1 /C ) * (((C*7500.0)*S1)*S2)-1 * ( 1 /C ) * (((C*2500.0)*S3)*S4),
    D(S2) ~ -1 * ( 1 /C ) * (((C*7500.0)*S1)*S2)+1 * ( 1 /C ) * (((C*2500.0)*S3)*S4)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.0001,
    S1 => 0.0001,
    S3 => 0.0002,
    S2 => 0.00012
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
