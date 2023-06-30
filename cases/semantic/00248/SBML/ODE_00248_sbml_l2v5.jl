# Model name: 00248_sbml_l2v5
# Number of parameters: 2
# Number of species: 3
function getODEModel_00248_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S3),
    D(S3) ~ 0.0,
    D(S2) ~ +1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.5,
    S3 => 1.2,
    S2 => 0.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.34,
    k1 => 1.78
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
