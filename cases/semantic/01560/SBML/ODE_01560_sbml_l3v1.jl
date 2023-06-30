# Model name: 01560_sbml_l3v1
# Number of parameters: 1
# Number of species: 3
function getODEModel_01560_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) P1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2, P1]

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
    D(S1) ~ -1.0 * ( 1 /C ) * (S1*0.1),
    D(S2) ~ +2.0 * ( 1 /C ) * (S1*0.1),
    D(P1) ~ S2_stoich
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 2.0,
    S2 => 3.0,
    P1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
