# Model name: 01139_sbml_l3v2
# Number of parameters: 2
# Number of species: 0
function getODEModel_01139_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p8 conv 

    ### Store parameters in array for ODESystem command
    parameterArray = [p8, conv]

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
    p8 => 8.0,
    conv => 0.1
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
