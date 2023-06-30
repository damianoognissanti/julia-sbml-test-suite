# Model name: 00713_sbml_l3v1
# Number of parameters: 4
# Number of species: 5
function getODEModel_00713_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) k1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2, k1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k3 C p1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [k3, C, p1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ +1.0 * ( 1 /C ) * (((C*k1)*S1)*S2)-1.0 * ( 1 /C ) * (((C*k2)*S3)*S4),
    D(S1) ~ -1.0 * ( 1 /C ) * (((C*k1)*S1)*S2)+1.0 * ( 1 /C ) * (((C*k2)*S3)*S4),
    D(S3) ~ +1.0 * ( 1 /C ) * (((C*k1)*S1)*S2)-1.0 * ( 1 /C ) * (((C*k2)*S3)*S4),
    D(S2) ~ -1.0 * ( 1 /C ) * (((C*k1)*S1)*S2)+1.0 * ( 1 /C ) * (((C*k2)*S3)*S4),
    D(k1) ~ p1*add(k2, k3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 5.0e-7,
    S1 => 1.0e-6,
    S3 => 2.0e-6,
    S2 => 1.5e-6,
    k1 => 1.0e6
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k3 => 700000.0,
    C => 0.15,
    p1 => 1.0,
    k2 => 300000.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
