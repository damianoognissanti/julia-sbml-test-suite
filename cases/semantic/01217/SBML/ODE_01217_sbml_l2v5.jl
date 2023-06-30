# Model name: 01217_sbml_l2v5
# Number of parameters: 4
# Number of species: 0
function getODEModel_01217_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters f c e a 

    ### Store parameters in array for ODESystem command
    parameterArray = [f, c, e, a]

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
    f => 4/2,
    c => (e+1)+1,
    e => f+1,
    a => (c+1)+1
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
