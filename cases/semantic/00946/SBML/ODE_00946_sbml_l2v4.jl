# Model name: 00946_sbml_l2v4
# Number of parameters: 2
# Number of species: 1
function getODEModel_00946_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters fakeC k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [fakeC, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ +1 * ( 1 /C ) * (((fakeC)*k1)/S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    fakeC => 1.0,
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
