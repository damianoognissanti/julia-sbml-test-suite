# Model name: 00816_sbml_l2v5
# Number of parameters: 3
# Number of species: 3
function getODEModel_00816_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

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
    D(S1) ~ -1 * ( 1 /C ) * (C*(((kf*S1)*S2)+((-1*kr)*S3))),
    D(S3) ~ +1 * ( 1 /C ) * (C*(((kf*S1)*S2)+((-1*kr)*S3))),
    D(S2) ~ -1 * ( 1 /C ) * (C*(((kf*S1)*S2)+((-1*kr)*S3)))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 1.0,
    S3 => 0.0,
    S2 => 0.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    kr => 0.09,
    kf => 1.1,
    C => 2.3
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
