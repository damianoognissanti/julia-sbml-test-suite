# Model name: 00083_sbml_l3v2
# Number of parameters: 2
# Number of species: 2
function getODEModel_00083_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t X(t) t(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [X, t]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C rate 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, rate]

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
    rate => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
