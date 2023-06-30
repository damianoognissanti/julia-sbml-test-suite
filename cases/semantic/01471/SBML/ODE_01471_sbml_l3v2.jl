# Model name: 01471_sbml_l3v2
# Number of parameters: 1
# Number of species: 2
function getODEModel_01471_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S(t) D(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S, D]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters comp 

    ### Store parameters in array for ODESystem command
    parameterArray = [comp]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S) ~ 0.0,
    D(D) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S => 5.0,
    D => 10.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    comp => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
