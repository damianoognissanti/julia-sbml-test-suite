# Model name: 00559_sbml_l2v5
# Number of parameters: 3
# Number of species: 4
function getODEModel_00559_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ 0.0,
    D(S1) ~ -1 * ( 1 /C ) * (((C*k1)*S1)*S2)+1 * ( 1 /C ) * ((C*k2)*S3),
    D(S3) ~ +1 * ( 1 /C ) * (((C*k1)*S1)*S2)-1 * ( 1 /C ) * ((C*k2)*S3),
    D(S2) ~ -2.0 * ( 1 /C ) * (((C*k1)*S1)*S2)+1 * ( 1 /C ) * ((C*k2)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.01,
    S1 => 0.01,
    S3 => 0.01,
    S2 => 0.02
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    k1 => 0.75,
    k2 => 0.25
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
