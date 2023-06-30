# Model name: 01289_sbml_l3v2
# Number of parameters: 2
# Number of species: 0
function getODEModel_01289_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p2 p1 

    ### Store parameters in array for ODESystem command
    parameterArray = [p2, p1]

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
    p2 => (gt(8, 5)),
    p1 => (gt(3, 5))
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
