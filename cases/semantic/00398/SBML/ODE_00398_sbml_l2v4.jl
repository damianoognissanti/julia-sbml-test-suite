# Model name: 00398_sbml_l2v4
# Number of parameters: 2
# Number of species: 3
function getODEModel_00398_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ (k2*S3)+(((-1*k1)*S1)*S2),
    D(S3) ~ ((k1*S1)*S2)+((-1*k2)*S3),
    D(S2) ~ (k2*S3)+(((-1*k1)*S1)*S2)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S3 => 1.0,
    S2 => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k1 => 0.75,
    k2 => 0.25
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
