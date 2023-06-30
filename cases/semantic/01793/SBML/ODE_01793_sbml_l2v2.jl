# Model name: 01793_sbml_l2v2
# Number of parameters: 1
# Number of species: 1
function getODEModel_01793_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C1 

    ### Store parameters in array for ODESystem command
    parameterArray = [C1]

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
    C1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
