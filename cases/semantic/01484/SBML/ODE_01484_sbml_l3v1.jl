# Model name: 01484_sbml_l3v1
# Number of parameters: 3
# Number of species: 1
function getODEModel_01484_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters conversionFactor C P1 

    ### Store parameters in array for ODESystem command
    parameterArray = [conversionFactor, C, P1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ +1.0 * ( 1 /C ) * (2)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    conversionFactor => 3.0,
    C => 1.0,
    P1 => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
