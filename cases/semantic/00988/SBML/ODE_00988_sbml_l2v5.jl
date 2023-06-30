# Model name: 00988_sbml_l2v5
# Number of parameters: 3
# Number of species: 2
function getODEModel_00988_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t B(t) A(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [B, A]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k1 k2 comp 

    ### Store parameters in array for ODESystem command
    parameterArray = [k1, k2, comp]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(B) ~ -1 * (k1)+1 * (k2*A),
    D(A) ~ +1 * (k1)-1 * (k2*A)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    B => 2.0,
    A => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k1 => 1.0,
    k2 => 0.0,
    comp => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
