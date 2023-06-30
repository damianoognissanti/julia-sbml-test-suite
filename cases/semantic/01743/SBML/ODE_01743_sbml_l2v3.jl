# Model name: 01743_sbml_l2v3
# Number of parameters: 1
# Number of species: 2
function getODEModel_01743_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t parameterId_0(t) S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [parameterId_0, S1]

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
    D(parameterId_0) ~ getOnePointFiv),
    D(S1) ~ +1 * ( 1 /C ) * (0.1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    parameterId_0 => 1.0,
    S1 => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
