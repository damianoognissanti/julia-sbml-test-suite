# Model name: 00749_sbml_l3v2
# Number of parameters: 3
# Number of species: 2
function getODEModel_00749_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /C ) * ((C*k2)*S1),
    D(S2) ~ +1.0 * ( 1 /C ) * ((C*k2)*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S2 => 0.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 0.79,
    k1 => 0.75,
    k2 => 5.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
