# Model name: 00879_sbml_l2v2
# Number of parameters: 4
# Number of species: 4
function getODEModel_00879_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k3 C k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [k3, C, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ +1 * ( 1 /C ) * ((C*k3)*S3),
    D(S1) ~ -1 * ( 1 /C ) * ((C*k1)*S1),
    D(S3) ~ +1 * ( 1 /C ) * ((C*k2)*S2)-1 * ( 1 /C ) * ((C*k3)*S3),
    D(S2) ~ +1 * ( 1 /C ) * ((C*k1)*S1)-1 * ( 1 /C ) * ((C*k2)*S2)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.0,
    S1 => 0.0001,
    S3 => 0.0,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k3 => 1.0,
    C => 1.0,
    k1 => (k2*exp(t))+0.2,
    k2 => 0.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
