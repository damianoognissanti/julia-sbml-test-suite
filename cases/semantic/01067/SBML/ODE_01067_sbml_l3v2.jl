# Model name: 01067_sbml_l3v2
# Number of parameters: 4
# Number of species: 3
function getODEModel_01067_sbml_l3v2()

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
    D(S1) ~ -1.0 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)+1 * ( 1 /compartment ) * ((compartment*k2)*S3),
    D(S3) ~ +1.0 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)-1.0 * ( 1 /compartment ) * ((compartment*k2)*S3),
    D(S2) ~ -1.0 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)+1 * ( 1 /compartment ) * ((compartment*k2)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.01,
    S3 => 0.01,
    S2 => 0.02
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    p1 => 1.0,
    k1 => 1.7,
    k2 => 0.3
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
