# Model name: 01651_sbml_l3v1
# Number of parameters: 3
# Number of species: 2
function getODEModel_01651_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C m_cf s1_cf 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, m_cf, s1_cf]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -2.0 * ( 1 /C ) * (0.01),
    D(S2) ~ +1.0 * ( 1 /C ) * (0.01)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 2.0,
    S2 => 3.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    m_cf => S1_stoich*3,
    s1_cf => S1_stoich*5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
