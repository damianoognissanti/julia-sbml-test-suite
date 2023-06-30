# Model name: 00575_sbml_l1v2
# Number of parameters: 4
# Number of species: 4
function getODEModel_00575_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t p4(t) p3(t) p2(t) p1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [p4, p3, p2, p1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters AssignedName k3 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [AssignedName, k3, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(p4) ~ k3*p3,
    D(p3) ~ (((k1*p1)*p2)+((-1*k2)*p3))+((-1*k3)*p3),
    D(p2) ~ (k2*p3)+(((-1*k1)*p1)*p2),
    D(p1) ~ ((((-1*k1)*p1)*p2)+(k2*p3))+(k3*p3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    p4 => 0.0,
    p3 => 0.0,
    p2 => 0.0002,
    p1 => 0.0002
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    AssignedName => nothing,
    k3 => 0.7,
    k1 => 10000.0,
    k2 => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
