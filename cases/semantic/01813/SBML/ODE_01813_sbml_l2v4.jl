# Model name: 01813_sbml_l2v4
# Number of parameters: 7
# Number of species: 0
function getODEModel_01813_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters NAN nan r NaN q p s 

    ### Store parameters in array for ODESystem command
    parameterArray = [NAN, nan, r, NaN, q, p, s]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [

    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [

    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    NAN => 0.1,
    nan => 0.001,
    r => NaN,
    NaN => 0.01,
    q => NaN,
    p => NaN,
    s => NaN
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
