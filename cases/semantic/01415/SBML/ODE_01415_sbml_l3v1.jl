# Model name: 01415_sbml_l3v1
# Number of parameters: 2
# Number of species: 2
function getODEModel_01415_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) P1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, P1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C k 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, k]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /C ) * (0.1*delay(P1, 1.0)),
    D(P1) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 5.0,
    P1 => 3.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    k => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
