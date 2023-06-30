# Model name: 01166_sbml_l3v1
# Number of parameters: 1
# Number of species: 4
function getODEModel_01166_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S(t) ES(t) D(t) E(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S, ES, D, E]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters comp 

    ### Store parameters in array for ODESystem command
    parameterArray = [comp]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S) ~ -1.0 * ( 1 /comp ) * ((S+E)/ES),
    D(ES) ~ -1.0 * ( 1 /comp ) * (ES/(E+D))+1.0 * ( 1 /comp ) * ((S+E)/ES),
    D(D) ~ +1.0 * ( 1 /comp ) * (ES/(E+D)),
    D(E) ~ +1.0 * ( 1 /comp ) * (ES/(E+D))-1.0 * ( 1 /comp ) * ((S+E)/ES)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S => 5.0,
    ES => 0.1,
    D => 10.0,
    E => 7.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    comp => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
