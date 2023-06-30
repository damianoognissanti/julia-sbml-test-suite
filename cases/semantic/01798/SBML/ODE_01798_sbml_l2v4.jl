# Model name: 01798_sbml_l2v4
# Number of parameters: 0
# Number of species: 3
function getODEModel_01798_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t P2(t) P1(t) P3(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [P2, P1, P3]

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
    D(P2) ~ 1,
    D(P1) ~ 1,
    D(P3) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    P2 => 0.0,
    P1 => 0.0,
    P3 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
