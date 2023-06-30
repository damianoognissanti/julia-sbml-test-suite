# Model name: 01392_sbml_l3v1
# Number of parameters: 7
# Number of species: 0
function getODEModel_01392_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters f g c e b a d 

    ### Store parameters in array for ODESystem command
    parameterArray = [f, g, c, e, b, a, d]

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
    f => nothing,
    g => f,
    c => b,
    e => d,
    b => nothing,
    a => 1.0,
    d => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
