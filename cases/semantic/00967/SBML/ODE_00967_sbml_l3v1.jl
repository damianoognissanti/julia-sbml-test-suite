# Model name: 00967_sbml_l3v1
# Number of parameters: 3
# Number of species: 0
function getODEModel_00967_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Q reset R 

    ### Store parameters in array for ODESystem command
    parameterArray = [Q, reset, R]

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
    Q => 0.0,
    reset => 0.0,
    R => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
