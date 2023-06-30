# Model name: 00893_sbml_l2v4
# Number of parameters: 1
# Number of species: 3
function getODEModel_00893_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t P2(t) P1(t) P3(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [P2, P1, P3]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(P2) ~ P1*P3,
    D(P1) ~ (-1*P1)*P3,
    D(P3) ~ k1*s
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    P2 => 0.0,
    P1 => 0.0015,
    P3 => 0.001
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k1 => 0.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
