# Model name: 00170_sbml_l1v2
# Number of parameters: 6
# Number of species: 3
function getODEModel_00170_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters AssignedName S2 k3 k4 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [AssignedName, S2, k3, k4, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ (k3*S2)+(((-1*k4)*S3)*S4),
    D(S1) ~ (k2*S2)+((-1*k1)*S1),
    D(S3) ~ (k3*S2)+(((-1*k4)*S3)*S4)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.0,
    S1 => 0.0001,
    S3 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    AssignedName => nothing,
    S2 => 0.0002,
    k3 => 0.15,
    k4 => 0.1,
    k1 => 0.75,
    k2 => 0.25
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
