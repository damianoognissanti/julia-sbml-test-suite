# Model name: 00574_sbml_l2v4
# Number of parameters: 3
# Number of species: 3
function getODEModel_00574_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t p3(t) p2(t) p1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [p3, p2, p1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p4 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [p4, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(p3) ~ (k1*p1)+((-1*k2)*p3),
    D(p2) ~ k2*p3,
    D(p1) ~ (-1*k1)*p1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    p3 => 1.0,
    p2 => 1.5,
    p1 => 1.25
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    p4 => 3.75,
    k1 => 0.1,
    k2 => 0.2
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
