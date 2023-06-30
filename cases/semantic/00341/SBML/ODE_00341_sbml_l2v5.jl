# Model name: 00341_sbml_l2v5
# Number of parameters: 3
# Number of species: 4
function getODEModel_00341_sbml_l2v5()

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
    D(S4) ~ 1.0e-7,
    D(S1) ~ 0.0,
    D(S3) ~ +1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)-1 * ( 1 /compartment ) * ((compartment*k2)*S3),
    D(S2) ~ -1 * ( 1 /compartment ) * (((compartment*k1)*S1)*S2)+1 * ( 1 /compartment ) * ((compartment*k2)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 1.0e-6,
    S1 => 1.5e-6,
    S3 => 1.5e-6,
    S2 => 2.0e-6
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    k1 => 750000.0,
    k2 => 0.00025
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
