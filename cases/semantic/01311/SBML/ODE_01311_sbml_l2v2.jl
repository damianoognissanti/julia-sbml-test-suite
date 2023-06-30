# Model name: 01311_sbml_l2v2
# Number of parameters: 1
# Number of species: 0
function getODEModel_01311_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p1 

    ### Store parameters in array for ODESystem command
    parameterArray = [p1]

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
    p1 => getgetthre)
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
