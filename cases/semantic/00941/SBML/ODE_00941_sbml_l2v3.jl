# Model name: 00941_sbml_l2v3
# Number of parameters: 1
# Number of species: 0
function getODEModel_00941_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters x 

    ### Store parameters in array for ODESystem command
    parameterArray = [x]

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
    x => sin(10*time)
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
