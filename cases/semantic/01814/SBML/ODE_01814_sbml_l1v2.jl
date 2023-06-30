# Model name: 01814_sbml_l1v2
# Number of parameters: 4
# Number of species: 0
function getODEModel_01814_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters true True AssignedName TRUE 

    ### Store parameters in array for ODESystem command
    parameterArray = [true, True, AssignedName, TRUE]

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
    AssignedName => nothing,
    TRUE => 30.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
