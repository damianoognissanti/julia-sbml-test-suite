# Model name: 01819_sbml_l1v2
# Number of parameters: 8
# Number of species: 0
function getODEModel_01819_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters AssignedName Pi c b PI pi a d 

    ### Store parameters in array for ODESystem command
    parameterArray = [AssignedName, Pi, c, b, PI, pi, a, d]

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
    c => 9.0,
    b => 8.0,
    PI => 9.0,
    pi => 7.0,
    a => 7.0,
    d => 3.14159265358979
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
