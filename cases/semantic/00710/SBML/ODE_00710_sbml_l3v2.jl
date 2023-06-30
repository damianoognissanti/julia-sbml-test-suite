# Model name: 00710_sbml_l3v2
# Number of parameters: 2
# Number of species: 3
function getODEModel_00710_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /C ) * ((C*k1)*S1),
    D(S3) ~ 0.15,
    D(S2) ~ +1.0 * ( 1 /C ) * ((C*k1)*S1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.5,
    S3 => 0.0,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.75,
    k1 => 1.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
