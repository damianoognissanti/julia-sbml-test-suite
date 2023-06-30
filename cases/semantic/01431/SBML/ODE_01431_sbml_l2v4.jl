# Model name: 01431_sbml_l2v4
# Number of parameters: 1
# Number of species: 2
function getODEModel_01431_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t B(t) A(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [B, A]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C 

    ### Store parameters in array for ODESystem command
    parameterArray = [C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(B) ~ -1 * ( 1 /C ) * (1)+1 * ( 1 /C ) * (1),
    D(A) ~ -1 * ( 1 /C ) * (1)+1 * ( 1 /C ) * (1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    B => 1.0,
    A => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
