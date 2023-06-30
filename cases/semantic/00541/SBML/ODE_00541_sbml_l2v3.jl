# Model name: 00541_sbml_l2v3
# Number of parameters: 3
# Number of species: 3
function getODEModel_00541_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t T(t) X0(t) X1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [T, X0, X1]

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
    D(T) ~ +1 * ( 1 /C ) * ((C*k1)*X0)-1 * ( 1 /C ) * ((C*k2)*T),
    D(X0) ~ -1 * ( 1 /C ) * ((C*k1)*X0),
    D(X1) ~ +1 * ( 1 /C ) * ((C*k2)*T)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    T => 0.0,
    X0 => 1.0,
    X1 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => nothing,
    k1 => 0.1,
    k2 => 0.375
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
