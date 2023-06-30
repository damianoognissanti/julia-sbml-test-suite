# Model name: 00242_sbml_l3v1
# Number of parameters: 3
# Number of species: 3
function getODEModel_00242_sbml_l3v1()

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
    D(S1) ~ -1.0 * ( 1 /compartment ) * ((k1*S1)*S2)+1.0 * ( 1 /compartment ) * (k2*S3),
    D(S3) ~ 0.0,
    D(S2) ~ 0.0
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
    compartment => nothing,
    k1 => 9.8,
    k2 => 0.57
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
