# Model name: 00179_sbml_l2v1
# Number of parameters: 3
# Number of species: 3
function getODEModel_00179_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters S4 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [S4, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ ((k2*S3)*S4)+(-1*multiply(k1, multiply(S1, S2))),
    D(S3) ~ multiply(k1, S1*S2)+(((-1*k2)*S3)*S4),
    D(S2) ~ ((k2*S3)*S4)+(-1*multiply(k1, multiply(S1, S2)))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.1,
    S3 => 0.1,
    S2 => 0.2
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    S4 => 0.1,
    k1 => 7.5,
    k2 => 2.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
