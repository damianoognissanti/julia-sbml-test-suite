# Model name: 00711_sbml_l3v1
# Number of parameters: 3
# Number of species: 4
function getODEModel_00711_sbml_l3v1()

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
    D(S4) ~ 0.0001,
    D(S1) ~ -1.0 * ( 1 /C ) * (((C*k1)*S1)*S2)+1.0 * ( 1 /C ) * ((C*k2)*S3),
    D(S3) ~ +1.0 * ( 1 /C ) * (((C*k1)*S1)*S2)-1.0 * ( 1 /C ) * ((C*k2)*S3),
    D(S2) ~ -1.0 * ( 1 /C ) * (((C*k1)*S1)*S2)+1.0 * ( 1 /C ) * ((C*k2)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.0001,
    S1 => 0.00015,
    S3 => 0.00015,
    S2 => 0.0002
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 0.93,
    k1 => 7500.0,
    k2 => 0.0025
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
