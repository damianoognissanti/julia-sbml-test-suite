# Model name: 01634_sbml_l2v2
# Number of parameters: 1
# Number of species: 3
function getODEModel_01634_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t parameterId_0(t) S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [parameterId_0, S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C 

    ### Store parameters in array for ODESystem command
    parameterArray = [C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(parameterId_0) ~ 1,
    D(S1) ~ -1 * ( 1 /C ) * (1),
    D(S2) ~ +1 * ( 1 /C ) * (1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    parameterId_0 => 1.0,
    S1 => 30.0,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
