# Model name: 00983_sbml_l2v2
# Number of parameters: 1
# Number of species: 1
function getODEModel_00983_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t x(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [x]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters temp 

    ### Store parameters in array for ODESystem command
    parameterArray = [temp]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(x) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    x => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    temp => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
