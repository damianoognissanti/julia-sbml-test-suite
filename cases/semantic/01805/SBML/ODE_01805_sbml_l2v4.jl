# Model name: 01805_sbml_l2v4
# Number of parameters: 3
# Number of species: 0
function getODEModel_01805_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Comp cOmP comp 

    ### Store parameters in array for ODESystem command
    parameterArray = [Comp, cOmP, comp]

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
    Comp => 4.0,
    cOmP => 5.0,
    comp => 3.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
