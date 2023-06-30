# Model name: 01470_sbml_l3v1
# Number of parameters: 2
# Number of species: 1
function getODEModel_01470_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t s1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [s1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C extentconv 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, extentconv]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(s1) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    s1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    extentconv => 1000.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
