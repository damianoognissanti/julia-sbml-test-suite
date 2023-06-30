# Model name: 00033_sbml_l2v3
# Number of parameters: 1
# Number of species: 3
function getODEModel_00033_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) k1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2, k1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /compartment ) * ((compartment*k1)*S1),
    D(S2) ~ +1 * ( 1 /compartment ) * ((compartment*k1)*S1),
    D(k1) ~ 0.5
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.15000000000000002,
    S2 => 0.0,
    k1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
