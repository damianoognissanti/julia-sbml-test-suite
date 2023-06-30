# Model name: 01814_sbml_l2v4
# Number of parameters: 3
# Number of species: 0
function getODEModel_01814_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters true True TRUE 

    ### Store parameters in array for ODESystem command
    parameterArray = [true, True, TRUE]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [

    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [

    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    true => 10.0,
    True => 20.0,
    TRUE => 30.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
