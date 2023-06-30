# Model name: 01640_sbml_l2v1
# Number of parameters: 1
# Number of species: 2
function getODEModel_01640_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S2(t) k0(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S2, k0]

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
    D(S2) ~ +1 * ( 1 /C ) * (1/3.0),
    D(k0) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S2 => 0.0,
    k0 => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
