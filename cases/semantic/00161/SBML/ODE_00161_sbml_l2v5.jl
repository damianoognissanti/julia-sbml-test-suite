# Model name: 00161_sbml_l2v5
# Number of parameters: 1
# Number of species: 2
function getODEModel_00161_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ (-1*k1)*S1,
    D(S2) ~ k1*S1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.015,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
