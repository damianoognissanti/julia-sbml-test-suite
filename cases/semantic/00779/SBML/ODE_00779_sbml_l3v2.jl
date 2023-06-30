# Model name: 00779_sbml_l3v2
# Number of parameters: 3
# Number of species: 4
function getODEModel_00779_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) T(t) X0(t) X1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, T, X0, X1]

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
    D(S1) ~ 0.0,
    D(T) ~ +1.0 * ( 1 /C ) * ((C*k1)*X0)-1.0 * ( 1 /C ) * ((C*k2)*T),
    D(X0) ~ -1.0 * ( 1 /C ) * ((C*k1)*X0),
    D(X1) ~ +1.0 * ( 1 /C ) * ((C*k2)*T)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 3.75,
    T => 1.0,
    X0 => 1.5+-0.25,
    X1 => 1.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    k1 => 0.1,
    k2 => 0.2
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
