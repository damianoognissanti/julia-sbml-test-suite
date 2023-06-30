# Model name: 00557_sbml_l2v2
# Number of parameters: 4
# Number of species: 4
function getODEModel_00557_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) T(t) X0(t) X1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, T, X0, X1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k3 C k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [k3, C, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ 0.0,
    D(T) ~ +2.0 * ( 1 /C ) * ((C*k1)*X0)-1 * ( 1 /C ) * ((C*k2)*S1),
    D(X0) ~ -1 * ( 1 /C ) * ((C*k1)*X0),
    D(X1) ~ +1 * ( 1 /C ) * ((C*k2)*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0,
    T => 0.0,
    X0 => 1.0,
    X1 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k3 => 2.5,
    C => 1.0,
    k1 => 0.1,
    k2 => 0.375
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
