# Model name: 01501_sbml_l3v1
# Number of parameters: 5
# Number of species: 2
function getODEModel_01501_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C P1 mconversion sconversion P0 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, P1, mconversion, sconversion, P0]

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
    P1 => nothing,
    mconversion => 3.0,
    sconversion => 2.0,
    P0 => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
