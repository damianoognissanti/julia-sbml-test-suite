# Model name: 00079_sbml_l2v3
# Number of parameters: 4
# Number of species: 3
function getODEModel_00079_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment p1 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, p1, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)+1 * ( 1 /compartment ) * ((compartment*k2)*S3),
    D(S3) ~ +1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)-1 * ( 1 /compartment ) * ((compartment*k2)*S3),
    D(S2) ~ -1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)+1 * ( 1 /compartment ) * ((compartment*k2)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0001,
    S3 => 0.00015000000000000001,
    S2 => 0.0002
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    p1 => 0.75,
    k1 => 7500.0,
    k2 => 0.0025
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
