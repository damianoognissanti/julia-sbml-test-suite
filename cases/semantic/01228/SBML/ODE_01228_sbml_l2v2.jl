# Model name: 01228_sbml_l2v2
# Number of parameters: 2
# Number of species: 1
function getODEModel_01228_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters c k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [c, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ +1 * ( 1 /c ) * (k1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    c => 1.0,
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
