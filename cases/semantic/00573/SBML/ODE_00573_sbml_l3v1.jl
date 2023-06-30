# Model name: 00573_sbml_l3v1
# Number of parameters: 4
# Number of species: 3
function getODEModel_00573_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t p3(t) p2(t) p1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [p3, p2, p1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p4 k3 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [p4, k3, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(p3) ~ (k1*p1)+((-1*k2)*p4),
    D(p2) ~ k2*p4,
    D(p1) ~ (-1*k1)*p1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    p3 => 0.0,
    p2 => 0.0,
    p1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    p4 => 0.0,
    k3 => 2.5,
    k1 => 0.1,
    k2 => 0.375
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
