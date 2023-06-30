# Model name: 00030_sbml_l2v5
# Number of parameters: 2
# Number of species: 1
function getODEModel_00030_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment S1 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, S1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    S1 => 7.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
