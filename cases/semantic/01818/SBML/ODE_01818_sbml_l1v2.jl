# Model name: 01818_sbml_l1v2
# Number of parameters: 4
# Number of species: 0
function getODEModel_01818_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters AssignedName Pi PI pi 

    ### Store parameters in array for ODESystem command
    parameterArray = [AssignedName, Pi, PI, pi]

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
    Pi => 8.0,
    PI => 9.0,
    pi => 7.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
