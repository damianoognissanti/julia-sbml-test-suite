# Model name: 00806_sbml_l2v1
# Number of parameters: 2
# Number of species: 2
function getODEModel_00806_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C k 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, k]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /C ) * ((C*k)*(S1^3)),
    D(S2) ~ +1 * ( 1 /C ) * ((C*k)*(S1^3))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    k => 0.65
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
