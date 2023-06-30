# Model name: 01141_sbml_l3v1
# Number of parameters: 2
# Number of species: 0
function getODEModel_01141_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C8 conv 

    ### Store parameters in array for ODESystem command
    parameterArray = [C8, conv]

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
    C8 => 8.0,
    conv => 0.1
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
