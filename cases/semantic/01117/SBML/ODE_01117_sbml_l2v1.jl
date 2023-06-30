# Model name: 01117_sbml_l2v1
# Number of parameters: 0
# Number of species: 2
function getODEModel_01117_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) C(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, C]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters 

    ### Store parameters in array for ODESystem command
    parameterArray = [

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ 0.0,
    D(C) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    C => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
