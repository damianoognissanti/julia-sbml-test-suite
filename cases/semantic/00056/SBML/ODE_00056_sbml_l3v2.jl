# Model name: 00056_sbml_l3v2
# Number of parameters: 4
# Number of species: 2
function getODEModel_00056_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment compartment1 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, compartment1, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /compartment ) * ((compartment*k1)*S1)+1.0 * ( 1 /compartment ) * ((compartment1*k2)*(S3+(-1*S1))),
    D(S3) ~ +1.0 * ( 1 /compartment1 ) * ((compartment*k1)*S1)-1.0 * ( 1 /compartment1 ) * ((compartment1*k2)*(S3+(-1*S1)))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S3 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    compartment1 => 1.0,
    k1 => 0.75,
    k2 => 0.25
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
