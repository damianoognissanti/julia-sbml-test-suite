# Model name: 01791_sbml_l2v2
# Number of parameters: 2
# Number of species: 0
function getODEModel_01791_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C1 P2 

    ### Store parameters in array for ODESystem command
    parameterArray = [C1, P2]

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
    C1 => 2.0,
    P2 => 3.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
