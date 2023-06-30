# Model name: 01185_sbml_l2v2
# Number of parameters: 3
# Number of species: 1
function getODEModel_01185_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C k1 y 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, k1, y]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ +1 * ( 1 /C ) * (k1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    k1 => y,
    y => 3.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
