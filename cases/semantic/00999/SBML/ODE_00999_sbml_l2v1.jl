# Model name: 00999_sbml_l2v1
# Number of parameters: 1
# Number of species: 9
function getODEModel_00999_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S7(t) S4(t) S5(t) S1(t) S3(t) S2(t) comp2(t) S6(t) S8(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S7, S4, S5, S1, S3, S2, comp2, S6, S8]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters comp1 

    ### Store parameters in array for ODESystem command
    parameterArray = [comp1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S7) ~ 0.0,
    D(S4) ~ 0.0,
    D(S5) ~ 0.0,
    D(S1) ~ 0.0,
    D(S3) ~ 0.0,
    D(S2) ~ 0.0,
    D(comp2) ~ 1,
    D(S6) ~ 0.0,
    D(S8) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S7 => 7.0,
    S4 => 4.0,
    S5 => 5.0,
    S1 => 1.0,
    S3 => 3.0,
    S2 => 2.0,
    comp2 => 10.0,
    S6 => 6.0,
    S8 => 8.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    comp1 => 10.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
