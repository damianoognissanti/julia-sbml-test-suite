# Model name: 01202_sbml_l2v3
# Number of parameters: 0
# Number of species: 2
function getODEModel_01202_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t x(t) y(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [x, y]

    ### Define variable parameters

    ### Define potential algebraic variables
    ModelingToolkit.@variables z(t)
    ### Define parameters
    ModelingToolkit.@parameters 

    ### Store parameters in array for ODESystem command
    parameterArray = [

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(x) ~ 1,
    D(y) ~ -2,
    z ~ ifelse(x <= 0.49, 2, ifelse(y > 0.49, 1, 0))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    x => 0.0,
    y => 2.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
