# Model name: 01266_sbml_l3v2
# Number of parameters: 1
# Number of species: 1
function getODEModel_01266_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t p1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [p1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p2 

    ### Store parameters in array for ODESystem command
    parameterArray = [p2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(p1) ~ 0.01*p1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    p1 => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    p2 => 10.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
