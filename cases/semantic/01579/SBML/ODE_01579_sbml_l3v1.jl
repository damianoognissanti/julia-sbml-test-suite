# Model name: 01579_sbml_l3v1
# Number of parameters: 2
# Number of species: 1
function getODEModel_01579_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t k1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [k1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters P1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [P1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(k1) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    k1 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    P1 => 1.0,
    k2 => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
