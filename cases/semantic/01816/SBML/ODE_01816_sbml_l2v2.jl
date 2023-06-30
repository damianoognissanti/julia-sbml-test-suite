# Model name: 01816_sbml_l2v2
# Number of parameters: 3
# Number of species: 0
function getODEModel_01816_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters false FALSE False 

    ### Store parameters in array for ODESystem command
    parameterArray = [false, FALSE, False]

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
    FALSE => 6.0,
    False => 5.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
