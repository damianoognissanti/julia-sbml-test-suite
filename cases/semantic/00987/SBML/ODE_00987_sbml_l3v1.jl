# Model name: 00987_sbml_l3v1
# Number of parameters: 2
# Number of species: 3
function getODEModel_00987_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t B(t) A(t) C(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [B, A, C]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters default_compartment k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [default_compartment, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(B) ~ -1.0 * (k1*B)+1.0 * (k1*A),
    D(A) ~ -1.0 * (k1*A),
    D(C) ~ +1.0 * (k1*B)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    B => 0.0,
    A => 1.0,
    C => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    default_compartment => 1.0,
    k1 => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
