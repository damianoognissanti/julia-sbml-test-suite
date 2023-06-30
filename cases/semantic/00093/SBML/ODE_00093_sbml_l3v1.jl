# Model name: 00093_sbml_l3v1
# Number of parameters: 4
# Number of species: 3
function getODEModel_00093_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment k3 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, k3, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /compartment ) * ((compartment*k1)*S1)+1.0 * ( 1 /compartment ) * ((compartment*k2)*S3),
    D(S3) ~ +1.0 * ( 1 /compartment ) * ((compartment*k1)*S1)-1.0 * ( 1 /compartment ) * ((compartment*k2)*S3),
    D(S2) ~ (k2*S3)+((-1*k1)*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0e-5,
    S3 => 1.0e-5,
    S2 => 1.5e-5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    k3 => 1.5,
    k1 => 0.015,
    k2 => 0.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
