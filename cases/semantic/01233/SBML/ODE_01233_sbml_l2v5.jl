# Model name: 01233_sbml_l2v5
# Number of parameters: 2
# Number of species: 1
function getODEModel_01233_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters c p1 

    ### Store parameters in array for ODESystem command
    parameterArray = [c, p1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ +1 * ( 1 /c ) * (1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    c => 1.0,
    p1 => (J0+1)
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
