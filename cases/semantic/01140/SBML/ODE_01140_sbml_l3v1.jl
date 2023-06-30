# Model name: 01140_sbml_l3v1
# Number of parameters: 2
# Number of species: 1
function getODEModel_01140_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t s8(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [s8]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C conv 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, conv]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(s8) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    s8 => 8.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    conv => 0.1
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
