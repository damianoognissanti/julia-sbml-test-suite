# Model name: 01701_sbml_l3v1
# Number of parameters: 0
# Number of species: 1
function getODEModel_01701_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t P1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [P1]

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
    D(P1) ~ -1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    P1 => 10.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
