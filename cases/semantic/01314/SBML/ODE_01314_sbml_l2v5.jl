# Model name: 01314_sbml_l2v5
# Number of parameters: 1
# Number of species: 0
function getODEModel_01314_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters p1 

    ### Store parameters in array for ODESystem command
    parameterArray = [p1]

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
    p1 => ((((x+1)(3)+1)+(3+1))+1)
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
