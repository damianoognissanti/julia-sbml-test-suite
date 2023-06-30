# Model name: 01219_sbml_l3v2
# Number of parameters: 1
# Number of species: 1
function getODEModel_01219_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters c 

    ### Store parameters in array for ODESystem command
    parameterArray = [c]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.2
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    c => 2.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
