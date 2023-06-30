# Model name: 01120_sbml_l3v2
# Number of parameters: 0
# Number of species: 2
function getODEModel_01120_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S3(t) comp(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S3, comp]

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
    D(S3) ~ 0.0,
    D(comp) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S3 => 2.0,
    comp => 5.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
