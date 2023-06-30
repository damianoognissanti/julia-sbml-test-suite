# Model name: 01475_sbml_l3v1
# Number of parameters: 2
# Number of species: 1
function getODEModel_01475_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t s1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [s1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C timeconv 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, timeconv]

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
    s1 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    timeconv => 100.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
