# Model name: 00669_sbml_l2v4
# Number of parameters: 4
# Number of species: 3
function getODEModel_00669_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C p1 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, p1, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /C ) * ((C*k1)*S1),
    D(S3) ~ +1 * ( 1 /C ) * ((C*k1)*S1)-1 * ( 1 /C ) * ((C*k2)*(multiply((func1(S3, p1)), p1))),
    D(S2) ~ +1 * ( 1 /C ) * ((C*k2)*(multiply((func1(S3, p1)), p1)))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S3 => 0.0,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 2.5,
    p1 => 2.5,
    k1 => 0.1,
    k2 => 0.15
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
