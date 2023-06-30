# Model name: 00917_sbml_l3v1
# Number of parameters: 0
# Number of species: 1
function getODEModel_00917_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t c(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [c]

    ### Define variable parameters

    ### Define potential algebraic variables

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
    D(c) ~ 0.5*c
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    c => 2.2/3.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
