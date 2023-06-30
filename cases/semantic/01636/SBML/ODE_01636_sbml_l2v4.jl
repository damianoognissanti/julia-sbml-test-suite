# Model name: 01636_sbml_l2v4
# Number of parameters: 1
# Number of species: 2
function getODEModel_01636_sbml_l2v4()

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
    D(parameterId_0) ~ 1,
    D(S1) ~ 0.0
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
