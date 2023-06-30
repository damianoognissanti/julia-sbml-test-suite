# Model name: 01016_sbml_l2v5
# Number of parameters: 3
# Number of species: 3
function getODEModel_01016_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

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
    D(S1) ~ -1 * (k1*S1),
    D(S3) ~ k1*k2,
    D(S2) ~ +1 * (k1*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.15,
    S3 => 0.1,
    S2 => 0.1
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 10.0,
    k1 => 1.75,
    k2 => 0.015
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
