# Model name: 01218_sbml_l2v4
# Number of parameters: 3
# Number of species: 0
function getODEModel_01218_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters c e a 

    ### Store parameters in array for ODESystem command
    parameterArray = [c, e, a]

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
    c => (a+1)+1,
    e => (c+1)+1,
    a => 4/2
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
