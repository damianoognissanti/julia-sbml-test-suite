# Model name: 01812_sbml_l1v2
# Number of parameters: 4
# Number of species: 0
function getODEModel_01812_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters AssignedName NAN nan NaN 

    ### Store parameters in array for ODESystem command
    parameterArray = [AssignedName, NAN, nan, NaN]

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
    AssignedName => nothing,
    NAN => 0.1,
    nan => 0.001,
    NaN => 0.01
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
