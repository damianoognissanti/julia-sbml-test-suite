# Model name: 01569_sbml_l2v2
# Number of parameters: 3
# Number of species: 4
function getODEModel_01569_sbml_l2v2()

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
    D(S4) ~ +1 * ( 1 /C ) * ((S3*S4)*k2),
    D(S1) ~ -1 * ( 1 /C ) * ((S1*S2)*k1),
    D(S3) ~ -1 * ( 1 /C ) * ((S3*S4)*k2),
    D(S2) ~ +1 * ( 1 /C ) * ((S1*S2)*k1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 4.0,
    S1 => 3.0,
    S3 => 4.0,
    S2 => 3.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    k1 => 0.5-time,
    k2 => time-0.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
