# Model name: 00365_sbml_l2v5
# Number of parameters: 3
# Number of species: 3
function getODEModel_00365_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

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
    D(S1) ~ -1 * ( 1 /C ) * ((k1*S1)*S2)+1 * ( 1 /C ) * (k2*S3),
    D(S3) ~ +1 * ( 1 /C ) * ((k1*S1)*S2)-1 * ( 1 /C ) * (k2*S3),
    D(S2) ~ -1 * ( 1 /C ) * ((k1*S1)*S2)+1 * ( 1 /C ) * (k2*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S3 => 1.0,
    S2 => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => nothing,
    k1 => 0.075,
    k2 => 0.025
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
