# Model name: 00228_sbml_l3v2
# Number of parameters: 2
# Number of species: 2
function getODEModel_00228_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ 0.0,
    D(S2) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.5e-6,
    S2 => 1.0e-6
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    k1 => 1.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
