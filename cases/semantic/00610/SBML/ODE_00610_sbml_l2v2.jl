# Model name: 00610_sbml_l2v2
# Number of parameters: 5
# Number of species: 3
function getODEModel_00610_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k3 C p1 k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [k3, C, p1, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /C ) * (((C*k1)*S1)*S2)+1 * ( 1 /C ) * ((C*k2)*S3),
    D(S3) ~ +1 * ( 1 /C ) * (((C*k1)*S1)*S2)-1 * ( 1 /C ) * ((C*k2)*S3),
    D(S2) ~ -1 * ( 1 /C ) * (((C*k1)*S1)*S2)+1 * ( 1 /C ) * ((C*k2)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0e-5,
    S3 => 1.0e-5,
    S2 => 1.5e-5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k3 => 1.5,
    C => 1.0,
    p1 => 0.5,
    k1 => 15000.0,
    k2 => 5.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
