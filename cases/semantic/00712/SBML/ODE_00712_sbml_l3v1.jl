# Model name: 00712_sbml_l3v1
# Number of parameters: 3
# Number of species: 3
function getODEModel_00712_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) k1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2, k1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k3 C k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [k3, C, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /C ) * ((C*k1)*S1),
    D(S2) ~ +1.0 * ( 1 /C ) * ((C*k1)*S1),
    D(k1) ~ add(k2, k3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.15,
    S2 => 0.0,
    k1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k3 => 0.3,
    C => 2.5,
    k2 => 0.2
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
