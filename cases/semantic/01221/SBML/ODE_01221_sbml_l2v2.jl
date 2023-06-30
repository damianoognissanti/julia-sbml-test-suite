# Model name: 01221_sbml_l2v2
# Number of parameters: 0
# Number of species: 2
function getODEModel_01221_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) c(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, c]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters 

    ### Store parameters in array for ODESystem command
    parameterArray = [

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ 1,
    D(c) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.2,
    c => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
