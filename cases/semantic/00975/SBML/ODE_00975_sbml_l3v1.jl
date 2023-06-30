# Model name: 00975_sbml_l3v1
# Number of parameters: 6
# Number of species: 2
function getODEModel_00975_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) S2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1, S2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k3 S1conv modelconv default_compartment k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [k3, S1conv, modelconv, default_compartment, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ -2.0 * ( 1 /default_compartment ) * ((k2*S1)/S2)+1.0 * ( 1 /default_compartment ) * (k1),
    D(S2) ~ +3.0 * ( 1 /default_compartment ) * ((k2*S1)/S2)-1.0 * ( 1 /default_compartment ) * (k3*S2)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 0.0,
    S2 => 0.001
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k3 => 1.4,
    S1conv => 3.0,
    modelconv => 4.0,
    default_compartment => 1.0,
    k1 => 1.0,
    k2 => 3.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
