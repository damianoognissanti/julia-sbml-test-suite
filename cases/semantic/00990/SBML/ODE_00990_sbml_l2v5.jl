# Model name: 00990_sbml_l2v5
# Number of parameters: 2
# Number of species: 2
function getODEModel_00990_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t X(t) p1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [X, p1]

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
    D(X) ~ +1 * ( 1 /default_compartment ) * (k1),
    D(p1) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    X => 1.0,
    p1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    default_compartment => 1.0,
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
