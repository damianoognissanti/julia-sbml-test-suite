# Model name: 00907_sbml_l3v1
# Number of parameters: 1
# Number of species: 1
function getODEModel_00907_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t c(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [c]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(c) ~ -1*(c/k1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    c => 22.5
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k1 => 0.175
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
