# Model name: 00703_sbml_l2v4
# Number of parameters: 2
# Number of species: 3
function getODEModel_00703_sbml_l2v4()

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
    D(S1) ~ -1 * ( 1 /C ) * (((C*7500.0)*S1)*S2)+1 * ( 1 /C ) * ((C*0.0025)*S3),
    D(S3) ~ +1 * ( 1 /C ) * (((C*7500.0)*S1)*S2)-1 * ( 1 /C ) * ((C*0.0025)*S3),
    D(S2) ~ -1 * ( 1 /C ) * (((C*7500.0)*S1)*S2)+1 * ( 1 /C ) * ((C*0.0025)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0001,
    S3 => 0.00015,
    S2 => 0.0002
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    k => 0.75
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
