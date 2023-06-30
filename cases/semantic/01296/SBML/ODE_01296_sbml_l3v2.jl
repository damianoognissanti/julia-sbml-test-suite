# Model name: 01296_sbml_l3v2
# Number of parameters: 1
# Number of species: 2
function getODEModel_01296_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t p2(t) p1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [p2, p1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C 

    ### Store parameters in array for ODESystem command
    parameterArray = [C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(p2) ~ +1.0 * ( 1 /C ) * (rateOf(p1)),
    D(p1) ~ +1.0 * ( 1 /C ) * (0.01*p1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    p2 => 10.0,
    p1 => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
