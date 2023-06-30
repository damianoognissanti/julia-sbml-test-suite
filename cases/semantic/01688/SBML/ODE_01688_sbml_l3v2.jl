# Model name: 01688_sbml_l3v2
# Number of parameters: 2
# Number of species: 2
function getODEModel_01688_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C s1_cf 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, s1_cf]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /C ) * (0.01),
    D(S2) ~ +1.0 * ( 1 /C ) * (0.01)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 2.0,
    S2 => 3.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    s1_cf => 5.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
