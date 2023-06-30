# Model name: 00270_sbml_l2v2
# Number of parameters: 4
# Number of species: 4
function getODEModel_00270_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment p2 p1 k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, p2, p1, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ +1 * ( 1 /compartment ) * ((ifelse(S2 > 7, p1, p2))),
    D(S1) ~ -1 * ( 1 /compartment ) * ((compartment*k1)*S1),
    D(S3) ~ -1 * ( 1 /compartment ) * ((ifelse(S2 > 7, p1, p2))),
    D(S2) ~ +1 * ( 1 /compartment ) * ((compartment*k1)*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.0,
    S1 => 10.0,
    S3 => 10.0,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    p2 => 0.05,
    p1 => 1.5,
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
