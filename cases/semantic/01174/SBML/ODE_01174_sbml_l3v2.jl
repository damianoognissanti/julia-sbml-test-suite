# Model name: 01174_sbml_l3v2
# Number of parameters: 3
# Number of species: 0
function getODEModel_01174_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters t3 timeconv t4 

    ### Store parameters in array for ODESystem command
    parameterArray = [t3, timeconv, t4]

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
    t3 => 1.0,
    timeconv => 60.0,
    t4 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
