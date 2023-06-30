# Model name: enzyme_identical_l3v1
# Number of parameters: 1
# Number of species: 1
function getODEModel_enzyme_identical_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S]

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
    D(S) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S => 10.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    comp => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
