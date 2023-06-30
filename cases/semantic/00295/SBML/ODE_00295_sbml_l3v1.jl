# Model name: 00295_sbml_l3v1
# Number of parameters: 3
# Number of species: 2
function getODEModel_00295_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * (k2*S1),
    D(S2) ~ +1.0 * (k2*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.1,
    S2 => 0.15
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    k1 => 1.05,
    k2 => 1.15
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
