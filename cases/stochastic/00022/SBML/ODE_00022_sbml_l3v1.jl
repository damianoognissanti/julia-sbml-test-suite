# Model name: 00022_sbml_l3v1
# Number of parameters: 3
# Number of species: 1
function getODEModel_00022_sbml_l3v1()

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
    D(X) ~ +1.0 * (5.0)-1.0 * (Mu*X)
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
    Alpha => 10.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
