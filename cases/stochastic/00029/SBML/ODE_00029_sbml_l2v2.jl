# Model name: 00029_sbml_l2v2
# Number of parameters: 3
# Number of species: 1
function getODEModel_00029_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t X(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [X]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Cell Mu Alpha 

    ### Store parameters in array for ODESystem command
    parameterArray = [Cell, Mu, Alpha]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(X) ~ +1 * (Alpha)-1 * (Mu*X)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    X => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    Cell => nothing,
    Mu => 0.1,
    Alpha => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
