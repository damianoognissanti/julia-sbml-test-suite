# Model name: 00795_sbml_l3v1
# Number of parameters: 3
# Number of species: 2
function getODEModel_00795_sbml_l3v1()

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
    D(S1) ~ -1.0 * ( 1 /C ) * ((C*k1)*S1),
    D(S2) ~ +1.0 * ( 1 /C ) * ((C*k1)*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S2 => 1.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => k2*(50^-1),
    k1 => 0.5,
    k2 => 50.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
