# Model name: 01326_sbml_l2v1
# Number of parameters: 2
# Number of species: 1
function getODEModel_01326_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t x(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [x]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C y 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, y]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(x) ~ +1 * ( 1 /C ) * (1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    x => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    y => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
