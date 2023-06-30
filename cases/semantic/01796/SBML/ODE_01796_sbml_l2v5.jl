# Model name: 01796_sbml_l2v5
# Number of parameters: 1
# Number of species: 3
function getODEModel_01796_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C 

    ### Store parameters in array for ODESystem command
    parameterArray = [C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ 0.0,
    D(S3) ~ 0.0,
    D(S2) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 2.0,
    S3 => 2.0,
    S2 => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 3.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
