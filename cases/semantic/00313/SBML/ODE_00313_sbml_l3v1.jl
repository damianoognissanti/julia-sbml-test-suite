# Model name: 00313_sbml_l3v1
# Number of parameters: 3
# Number of species: 4
function getODEModel_00313_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) p2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2, p2]

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
    D(S1) ~ -1.0 * ( 1 /C ) * ((((p1*p2)*k1)*S1)*S2)+1.0 * ( 1 /C ) * (((p1*p2)*k2)*S3),
    D(S3) ~ +1.0 * ( 1 /C ) * ((((p1*p2)*k1)*S1)*S2)-1.0 * ( 1 /C ) * (((p1*p2)*k2)*S3),
    D(S2) ~ -1.0 * ( 1 /C ) * ((((p1*p2)*k1)*S1)*S2)+1.0 * ( 1 /C ) * (((p1*p2)*k2)*S3),
    D(p2) ~ 0.1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S3 => 1.0,
    S2 => 2.0,
    p2 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    p1 => 0.1,
    k1 => 0.75,
    k2 => 2.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
