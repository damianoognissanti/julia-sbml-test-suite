# Model name: 00057_sbml_l2v2
# Number of parameters: 1
# Number of species: 3
function getODEModel_00057_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S3(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S3, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters compartment 

    ### Store parameters in array for ODESystem command
    parameterArray = [compartment]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -1 * ( 1 /compartment ) * ((compartment*1.0)*S1),
    D(S3) ~ +1 * ( 1 /compartment ) * ((compartment*2.0)*S2),
    D(S2) ~ +1 * ( 1 /compartment ) * ((compartment*1.0)*S1)-1 * ( 1 /compartment ) * ((compartment*2.0)*S2)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0003,
    S3 => 0.0,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    compartment => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
