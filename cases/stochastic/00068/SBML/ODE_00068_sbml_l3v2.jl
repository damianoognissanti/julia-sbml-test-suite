# Model name: 00068_sbml_l3v2
# Number of parameters: 4
# Number of species: 2
function getODEModel_00068_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t X(t) t(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [X, t]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C rate truncationUpperBound truncationLowerBound 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, rate, truncationUpperBound, truncationLowerBound]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(X) ~ 0.0,
    D(t) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    X => 0.0,
    t => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    rate => 1.0,
    truncationUpperBound => 0.75,
    truncationLowerBound => 0.25
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
