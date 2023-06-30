# Model name: 00974_sbml_l3v2
# Number of parameters: 3
# Number of species: 2
function getODEModel_00974_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t Y(t) X(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [Y, X]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Q default_compartment k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [Q, default_compartment, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(Y) ~ Xref,
    D(X) ~ +1.0 * ( 1 /default_compartment ) * (k1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    Y => 0.0,
    X => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    Q => Xref,
    default_compartment => 1.0,
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
