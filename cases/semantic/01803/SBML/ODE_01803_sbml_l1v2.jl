# Model name: 01803_sbml_l1v2
# Number of parameters: 4
# Number of species: 0
function getODEModel_01803_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters AssignedName param Param pArAm 

    ### Store parameters in array for ODESystem command
    parameterArray = [AssignedName, param, Param, pArAm]

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
    AssignedName => nothing,
    param => 3.0,
    Param => 4.0,
    pArAm => 5.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
