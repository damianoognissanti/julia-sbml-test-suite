# Model name: 00996_sbml_l3v2
# Number of parameters: 2
# Number of species: 1
function getODEModel_00996_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t p1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [p1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p3 p2 

    ### Store parameters in array for ODESystem command
    parameterArray = [p3, p2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(p1) ~ -1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    p1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    p3 => 0.0,
    p2 => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
