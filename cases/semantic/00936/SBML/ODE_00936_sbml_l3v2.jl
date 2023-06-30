# Model name: 00936_sbml_l3v2
# Number of parameters: 2
# Number of species: 2
function getODEModel_00936_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables
    ModelingToolkit.@variables S1(t)
    ### Define parameters
    ModelingToolkit.@parameters default_compartment S1_bool1 

    ### Store parameters in array for ODESystem command
    parameterArray = [default_compartment, S1_bool1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ 0.0,
    D(S2) ~ 0.0,
    S1 ~ ((1 - S1_bool1)*( sin(t*10)) + S1_bool1*( 1))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0,
    S2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    default_compartment => 1.0,
    S1_bool1 => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
