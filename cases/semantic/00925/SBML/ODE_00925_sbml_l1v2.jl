# Model name: 00925_sbml_l1v2
# Number of parameters: 2
# Number of species: 0
function getODEModel_00925_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters AssignedName k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [AssignedName, k2]

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
    k2 => 0.2
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
