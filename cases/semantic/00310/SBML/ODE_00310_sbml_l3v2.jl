# Model name: 00310_sbml_l3v2
# Number of parameters: 2
# Number of species: 3
function getODEModel_00310_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) p2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2, p2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p1 k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [p1, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /C ) * (((p1*p2)*k1)*S1),
    D(S2) ~ +1.0 * ( 1 /C ) * (((p1*p2)*k1)*S1),
    D(p2) ~ 0.1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.5,
    S2 => 0.0,
    p2 => 1.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    p1 => 0.1,
    k1 => 0.9
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
