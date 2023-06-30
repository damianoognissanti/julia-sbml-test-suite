# Model name: 00023_sbml_l2v5
# Number of parameters: 5
# Number of species: 4
function getODEModel_00023_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment k3 k4 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, k3, k4, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ -1 * ( 1 /compartment ) * (((compartment*k4)*S3)*S4)+1 * ( 1 /compartment ) * ((compartment*k3)*S2),
    D(S1) ~ -1 * ( 1 /compartment ) * ((compartment*k1)*S1)+1 * ( 1 /compartment ) * ((compartment*k2)*S2),
    D(S3) ~ -1 * ( 1 /compartment ) * (((compartment*k4)*S3)*S4)+1 * ( 1 /compartment ) * ((compartment*k3)*S2),
    D(S2) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.0,
    S1 => 0.1,
    S3 => 0.0,
    S2 => 0.2
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    k3 => 0.1,
    k4 => 0.1,
    k1 => 0.75,
    k2 => 0.25
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
