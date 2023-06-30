# Model name: 01774_sbml_l3v2
# Number of parameters: 1
# Number of species: 3
function getODEModel_01774_sbml_l3v2()

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
    D(S1) ~ -2.0 * (0.01),
    D(S3) ~ -1.0 * (S1_stoich/20),
    D(S2) ~ +1.0 * (0.01)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 2.0,
    S3 => 4.0,
    S2 => 3.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 2.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
