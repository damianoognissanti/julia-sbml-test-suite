# Model name: 00989_sbml_l2v5
# Number of parameters: 2
# Number of species: 2
function getODEModel_00989_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t Y(t) X(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [Y, X]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters default_compartment k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [default_compartment, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(Y) ~ +1 * (k1*Y),
    D(X) ~ +1 * (k1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    Y => 1.0,
    X => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    default_compartment => 1.0,
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
