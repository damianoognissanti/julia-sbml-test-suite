# Model name: 00973_sbml_l2v1
# Number of parameters: 2
# Number of species: 2
function getODEModel_00973_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t parameterId_0(t) X(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [parameterId_0, X]

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
    D(parameterId_0) ~ 0.01,
    D(X) ~ +1 * ( 1 /default_compartment ) * (k1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    parameterId_0 => 1.0,
    X => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    default_compartment => 1.0,
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
