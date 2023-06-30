# Model name: 00289_sbml_l2v4
# Number of parameters: 5
# Number of species: 3
function getODEModel_00289_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment compartment1 k3 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, compartment1, k3, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2),
    D(S3) ~ +1 * ( 1 /compartment1 ) * ((compartment1*k2)*(S2+(-1*S3))),
    D(S2) ~ -1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)+2.0 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)-1 * ( 1 /compartment ) * ((compartment1*k2)*(S2+(-1*S3)))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S3 => 0.0,
    S2 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    compartment1 => 1.0,
    k3 => 0.25,
    k1 => 0.75,
    k2 => 0.25
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
