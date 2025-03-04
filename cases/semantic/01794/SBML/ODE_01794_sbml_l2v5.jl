# Model name: 01794_sbml_l2v5
# Number of parameters: 2
# Number of species: 1
function getODEModel_01794_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C P1 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, P1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S2) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S2 => 3.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    P1 => 2.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
