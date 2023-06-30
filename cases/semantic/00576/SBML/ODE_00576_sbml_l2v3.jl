# Model name: 00576_sbml_l2v3
# Number of parameters: 3
# Number of species: 3
function getODEModel_00576_sbml_l2v3()

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
    D(p3) ~ ((k1*p1)*p2)+(-1*(k2*p3)),
    D(p2) ~ (k2*p3)+(-1*((k1*p1)*p2)),
    D(p1) ~ (k2*p3)+(-1*((k1*p1)*p2))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    p3 => 0.001,
    p2 => 0.002,
    p1 => 0.001
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    p4 => 0.001,
    k1 => 0.75,
    k2 => 0.25
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
