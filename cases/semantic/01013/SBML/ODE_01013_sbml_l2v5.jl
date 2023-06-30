# Model name: 01013_sbml_l2v5
# Number of parameters: 3
# Number of species: 4
function getODEModel_01013_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ +1 * ((k1*S1)*S2)-1 * ((k2*S3)*S4),
    D(S1) ~ -1 * ((k1*S1)*S2)+1 * ((k2*S3)*S4),
    D(S3) ~ +1 * ((k1*S1)*S2)-1 * ((k2*S3)*S4),
    D(S2) ~ -1 * ((k1*S1)*S2)+1 * ((k2*S3)*S4)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.001,
    S1 => 0.01,
    S3 => 0.02,
    S2 => 0.015
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 10.0,
    k1 => 620.0,
    k2 => 500.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
