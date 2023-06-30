# Model name: 01819_sbml_l2v1
# Number of parameters: 7
# Number of species: 0
function getODEModel_01819_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Pi c b PI pi a d 

    ### Store parameters in array for ODESystem command
    parameterArray = [Pi, c, b, PI, pi, a, d]

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
