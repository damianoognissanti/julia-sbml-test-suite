# Model name: 00027_sbml_l3v1
# Number of parameters: 2
# Number of species: 1
function getODEModel_00027_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t X(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [X]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k Cell 

    ### Store parameters in array for ODESystem command
    parameterArray = [k, Cell]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(X) ~ +1.0 * (1.0)-1.0 * (0.1*X)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    X => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k => 2.0,
    Cell => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
