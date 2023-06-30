# Model name: 00283_sbml_l2v4
# Number of parameters: 3
# Number of species: 3
function getODEModel_00283_sbml_l2v4()

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
    D(S1) ~ -1 * ( 1 /compartment ) * (compartment*((k1*S1)*S2))+1 * ( 1 /compartment ) * ((compartment*k2)*S3),
    D(S3) ~ +1 * ( 1 /compartment ) * (compartment*((k1*S1)*S2))-1 * ( 1 /compartment ) * ((compartment*k2)*S3),
    D(S2) ~ -1 * ( 1 /compartment ) * (compartment*((k1*S1)*S2))+1 * ( 1 /compartment ) * ((compartment*k2)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0e-6,
    S3 => 1.0e-6,
    S2 => 2.0e-6
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 6.8,
    k1 => 3.24,
    k2 => 0.125
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
