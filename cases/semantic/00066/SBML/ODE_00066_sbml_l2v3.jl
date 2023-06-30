# Model name: 00066_sbml_l2v3
# Number of parameters: 2
# Number of species: 5
function getODEModel_00066_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) k1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2, k1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ +1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)-1 * ( 1 /compartment ) * (((compartment*k2)*S3)*S4),
    D(S1) ~ -1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)+1 * ( 1 /compartment ) * (((compartment*k2)*S3)*S4),
    D(S3) ~ +1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)-1 * ( 1 /compartment ) * (((compartment*k2)*S3)*S4),
    D(S2) ~ -1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)+1 * ( 1 /compartment ) * (((compartment*k2)*S3)*S4),
    D(k1) ~ 1000000
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 5.0e-7,
    S1 => 1.0e-6,
    S3 => 2.0e-6,
    S2 => 1.5e-6,
    k1 => 1.0e6
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    k2 => 300000.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
