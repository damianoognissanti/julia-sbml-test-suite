# Model name: 00565_sbml_l2v5
# Number of parameters: 2
# Number of species: 4
function getODEModel_00565_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) T(t) X0(t) X1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, T, X0, X1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C k 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, k]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ 0.0,
    D(T) ~ +1 * ( 1 /C ) * ((C*0.1)*X0)-1 * ( 1 /C ) * ((C*0.375)*S1),
    D(X0) ~ -1 * ( 1 /C ) * ((C*0.1)*X0),
    D(X1) ~ +1 * ( 1 /C ) * ((C*0.375)*S1)
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
    C => 1.0,
    k => 2.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
