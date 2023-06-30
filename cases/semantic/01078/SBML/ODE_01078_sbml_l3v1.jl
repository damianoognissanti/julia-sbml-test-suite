# Model name: 01078_sbml_l3v1
# Number of parameters: 4
# Number of species: 2
function getODEModel_01078_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C p1 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, p1, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /C ) * ((C*k2)*S1),
    D(S2) ~ +1 * ( 1 /C ) * ((C*k2)*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => k1*1.5,
    S2 => 1.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    p1 => 0.5,
    k1 => 0.75,
    k2 => 5.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
