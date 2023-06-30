# Model name: 01160_sbml_l3v2
# Number of parameters: 1
# Number of species: 0
function getODEModel_01160_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters new_p1 

    ### Store parameters in array for ODESystem command
    parameterArray = [new_p1]

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
    new_p1 => 10.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
