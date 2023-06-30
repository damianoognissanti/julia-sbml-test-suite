# Model name: 01054_sbml_l1v2
# Number of parameters: 3
# Number of species: 4
function getODEModel_01054_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S4(t) S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S4, S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters kr kf C 

    ### Store parameters in array for ODESystem command
    parameterArray = [kr, kf, C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S4) ~ 0.0,
    D(S1) ~ +1.0 * ( 1 /C ) * (-(C*(((kf*S1)*S2)+((-1*kr)*S3)))),
    D(S3) ~ -1.0 * ( 1 /C ) * (-(C*(((kf*S1)*S2)+((-1*kr)*S3)))),
    D(S2) ~ +1.0 * ( 1 /C ) * (-(C*(((kf*S1)*S2)+((-1*kr)*S3))))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S4 => 0.0001,
    S1 => 0.0001,
    S3 => 0.0001,
    S2 => 0.0002
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    kr => 0.25,
    kf => 0.75,
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
