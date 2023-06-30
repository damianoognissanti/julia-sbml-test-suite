# Model name: 01338_sbml_l3v1
# Number of parameters: 1
# Number of species: 2
function getODEModel_01338_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) k1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, k1]

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
    D(S1) ~ +1.0 * ( 1 /C ) * (k1),
    D(k1) ~ -1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0,
    k1 => 5.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
