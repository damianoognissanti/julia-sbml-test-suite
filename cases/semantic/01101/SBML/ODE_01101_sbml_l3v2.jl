# Model name: 01101_sbml_l3v2
# Number of parameters: 3
# Number of species: 4
function getODEModel_01101_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

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
    D(S4) ~ +1.0 * ( 1 /C ) * (((C*0.7)*S3)*s),
    D(S1) ~ -1 * ( 1 /C ) * ((((C*k1)*S1)*S2)*s)+1.0 * ( 1 /C ) * (((C*0.9)*S3)*s)+1.0 * ( 1 /C ) * (((C*0.7)*S3)*s),
    D(S3) ~ +1.0 * ( 1 /C ) * ((((C*k1)*S1)*S2)*s)-1.0 * ( 1 /C ) * (((C*0.9)*S3)*s)-1.0 * ( 1 /C ) * (((C*0.7)*S3)*s),
    D(S2) ~ -1.0 * ( 1 /C ) * ((((C*k1)*S1)*S2)*s)+1.0 * ( 1 /C ) * (((C*0.9)*S3)*s)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.0,
    S1 => 2.0,
    S3 => 0.0,
    S2 => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    p1 => 1.0,
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
