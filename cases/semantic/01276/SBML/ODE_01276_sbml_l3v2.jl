# Model name: 01276_sbml_l3v2
# Number of parameters: 3
# Number of species: 0
function getODEModel_01276_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p3 p2 p1 

    ### Store parameters in array for ODESystem command
    parameterArray = [p3, p2, p1]

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
    p3 => min(20, 200, 2, 2000),
    p2 => min(30),
    p1 => min(-1, -10)
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
