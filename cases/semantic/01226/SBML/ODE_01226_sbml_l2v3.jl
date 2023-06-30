# Model name: 01226_sbml_l2v3
# Number of parameters: 1
# Number of species: 2
function getODEModel_01226_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) p1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, p1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters c 

    ### Store parameters in array for ODESystem command
    parameterArray = [c]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ +1 * ( 1 /c ) * (1),
    D(p1) ~ J0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0,
    p1 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    c => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
