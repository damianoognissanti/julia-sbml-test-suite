# Model name: 01803_sbml_l2v5
# Number of parameters: 3
# Number of species: 0
function getODEModel_01803_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters param Param pArAm 

    ### Store parameters in array for ODESystem command
    parameterArray = [param, Param, pArAm]

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
    param => 3.0,
    Param => 4.0,
    pArAm => 5.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
