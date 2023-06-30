# Model name: 01817_sbml_l2v1
# Number of parameters: 6
# Number of species: 0
function getODEModel_01817_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters false c FALSE False b a 

    ### Store parameters in array for ODESystem command
    parameterArray = [false, c, FALSE, False, b, a]

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
    false => 4.0,
    c => 6.0,
    FALSE => 6.0,
    False => 5.0,
    b => 5.0,
    a => 4.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
