# Model name: 01172_sbml_l3v1
# Number of parameters: 2
# Number of species: 0
function getODEModel_01172_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters t1 timeconv 

    ### Store parameters in array for ODESystem command
    parameterArray = [t1, timeconv]

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
    t1 => 1.0,
    timeconv => 60.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
