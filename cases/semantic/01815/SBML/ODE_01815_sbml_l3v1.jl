# Model name: 01815_sbml_l3v1
# Number of parameters: 6
# Number of species: 0
function getODEModel_01815_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters true True c TRUE b a 

    ### Store parameters in array for ODESystem command
    parameterArray = [true, True, c, TRUE, b, a]

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
    c => TRUE,
    TRUE => 30.0,
    b => True,
    a => true
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
