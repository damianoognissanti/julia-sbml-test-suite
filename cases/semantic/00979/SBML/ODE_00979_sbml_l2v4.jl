# Model name: 00979_sbml_l2v4
# Number of parameters: 4
# Number of species: 0
function getODEModel_00979_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters x q p y 

    ### Store parameters in array for ODESystem command
    parameterArray = [x, q, p, y]

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
    x => 0.0,
    q => 0.0,
    p => 0.0,
    y => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
