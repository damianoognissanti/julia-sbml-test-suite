# Model name: 00870_sbml_l2v1
# Number of parameters: 5
# Number of species: 4
function getODEModel_00870_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t A2(t) A3(t) A1(t) A4(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [A2, A3, A1, A4]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Kr1 Kr C Kf1 Kf 

    ### Store parameters in array for ODESystem command
    parameterArray = [Kr1, Kr, C, Kf1, Kf]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(A2) ~ +1 * ( 1 /C ) * (((Kf1*A4)+(-(Kr1*A2)))*C)-1 * ( 1 /C ) * ((((Kf*A1)*A2)+(-(Kr*A3)))*C),
    D(A3) ~ +1 * ( 1 /C ) * ((((Kf*A1)*A2)+(-(Kr*A3)))*C),
    D(A1) ~ -1 * ( 1 /C ) * ((((Kf*A1)*A2)+(-(Kr*A3)))*C),
    D(A4) ~ -1 * ( 1 /C ) * (((Kf1*A4)+(-(Kr1*A2)))*C)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    A2 => 3.0,
    A3 => 4.0,
    A1 => 2.0,
    A4 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    Kr1 => 2.0,
    Kr => 2.0,
    C => 1.0,
    Kf1 => 1.0,
    Kf => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
