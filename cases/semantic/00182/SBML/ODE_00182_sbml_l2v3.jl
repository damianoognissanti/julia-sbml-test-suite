# Model name: 00182_sbml_l2v3
# Number of parameters: 3
# Number of species: 1
function getODEModel_00182_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters S2 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [S2, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ k2*S2
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    S2 => 0.5,
    k1 => 1.0,
    k2 => 0.8
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
