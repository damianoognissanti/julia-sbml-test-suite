# Model name: 00269_sbml_l3v1
# Number of parameters: 3
# Number of species: 2
function getODEModel_00269_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment p2 p1 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment, p2, p1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /compartment ) * ((factorial(ceiling(S1*p1))*(p2^-1))),
    D(S2) ~ +1.0 * ( 1 /compartment ) * ((factorial(ceiling(S1*p1))*(p2^-1)))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0,
    p2 => 25.0,
    p1 => 4.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
