# Model name: 01206_sbml_l2v1
# Number of parameters: 0
# Number of species: 2
function getODEModel_01206_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t C1(t) S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [C1, S1]

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
    D(C1) ~ 0.2,
    D(S1) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    C1 => 0.5,
    S1 => 3.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
