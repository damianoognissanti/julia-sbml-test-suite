# Model name: 01320_sbml_l2v3
# Number of parameters: 2
# Number of species: 1
function getODEModel_01320_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C p1 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, p1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ +1 * ( 1 /C ) * (1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    p1 => 5.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
