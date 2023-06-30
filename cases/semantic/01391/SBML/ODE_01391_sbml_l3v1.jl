# Model name: 01391_sbml_l3v1
# Number of parameters: 4
# Number of species: 0
function getODEModel_01391_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters f b a d 

    ### Store parameters in array for ODESystem command
    parameterArray = [f, b, a, d]

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
    b => nothing,
    a => 1.0,
    d => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
