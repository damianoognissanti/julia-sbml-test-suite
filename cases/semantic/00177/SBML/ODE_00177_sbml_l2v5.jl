# Model name: 00177_sbml_l2v5
# Number of parameters: 0
# Number of species: 3
function getODEModel_00177_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) k1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2, k1]

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
    D(S1) ~ (-1*k1)*S1,
    D(S2) ~ k1*S1,
    D(k1) ~ 0.5
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.15,
    S2 => 0.0,
    k1 => 0.1
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
