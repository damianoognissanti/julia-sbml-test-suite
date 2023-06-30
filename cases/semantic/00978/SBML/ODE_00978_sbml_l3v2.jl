# Model name: 00978_sbml_l3v2
# Number of parameters: 4
# Number of species: 0
function getODEModel_00978_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters multitrig x z y 

    ### Store parameters in array for ODESystem command
    parameterArray = [multitrig, x, z, y]

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
    multitrig => 0.0,
    x => 0.0,
    z => 0.0,
    y => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
