# Model name: 00537_sbml_l2v4
# Number of parameters: 3
# Number of species: 3
function getODEModel_00537_sbml_l2v4()

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
    T => 1.0,
    X0 => 1.25,
    X1 => 1.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    k1 => 0.1,
    k2 => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
