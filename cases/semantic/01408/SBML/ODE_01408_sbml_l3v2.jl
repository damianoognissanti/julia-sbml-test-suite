# Model name: 01408_sbml_l3v2
# Number of parameters: 3
# Number of species: 2
function getODEModel_01408_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C mconversion sconversion 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, mconversion, sconversion]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /C ) * (0.1*S1),
    D(S2) ~ +1.0 * ( 1 /C ) * (0.1*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 5.0,
    S2 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    mconversion => 3.0,
    sconversion => 2.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
