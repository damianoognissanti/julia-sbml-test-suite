# Model name: 01570_sbml_l2v2
# Number of parameters: 1
# Number of species: 3
function getODEModel_01570_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) k(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2, k]

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
    D(S1) ~ -1 * ( 1 /C ) * (ifelse(k > 0, S1*k, S2*k)),
    D(S2) ~ +1 * ( 1 /C ) * (ifelse(k > 0, S1*k, S2*k)),
    D(k) ~ -1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 3.0,
    S2 => 3.0,
    k => 4.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
