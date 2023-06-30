# Model name: 01820_sbml_l1v2
# Number of parameters: 4
# Number of species: 0
function getODEModel_01820_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters TIME AssignedName time Time 

    ### Store parameters in array for ODESystem command
    parameterArray = [TIME, AssignedName, time, Time]

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
    TIME => 12.0,
    AssignedName => nothing,
    time => 10.0,
    Time => 11.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
