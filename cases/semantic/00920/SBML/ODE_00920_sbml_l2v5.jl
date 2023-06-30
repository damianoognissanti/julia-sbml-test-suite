# Model name: 00920_sbml_l2v5
# Number of parameters: 2
# Number of species: 0
function getODEModel_00920_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [

    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [

    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k1 => 2.5*k2,
    k2 => 0.3
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
