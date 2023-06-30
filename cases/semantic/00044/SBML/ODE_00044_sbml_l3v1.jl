# Model name: 00044_sbml_l3v1
# Number of parameters: 3
# Number of species: 4
function getODEModel_00044_sbml_l3v1()

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
    D(S4) ~ +1.0 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)-1.0 * ( 1 /compartment ) * (((compartment*k2)*S3)*S4),
    D(S1) ~ -1.0 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)+1.0 * ( 1 /compartment ) * (((compartment*k2)*S3)*S4),
    D(S3) ~ +1.0 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)-1.0 * ( 1 /compartment ) * (((compartment*k2)*S3)*S4),
    D(S2) ~ -1.0 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)+1.0 * ( 1 /compartment ) * (((compartment*k2)*S3)*S4)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.01,
    S1 => 0.01,
    S3 => 0.02,
    S2 => 0.01
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    k1 => 75.0,
    k2 => 25.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
