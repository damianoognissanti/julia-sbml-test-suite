# Model name: 00524_sbml_l3v1
# Number of parameters: 2
# Number of species: 3
function getODEModel_00524_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C p1 

    ### Store parameters in array for ODESystem command
    parameterArray = [C, p1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1.0 * ( 1 /C ) * (((C*0.75)*S1)*S2)+1.0 * ( 1 /C ) * ((C*0.25)*S3),
    D(S3) ~ +1.0 * ( 1 /C ) * (((C*0.75)*S1)*S2)-1.0 * ( 1 /C ) * ((C*0.25)*S3),
    D(S2) ~ -1.0 * ( 1 /C ) * (((C*0.75)*S1)*S2)+1.0 * ( 1 /C ) * ((C*0.25)*S3)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 2*p1,
    S3 => 0.0001,
    S2 => 0.0002
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0,
    p1 => 1.25e-5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
