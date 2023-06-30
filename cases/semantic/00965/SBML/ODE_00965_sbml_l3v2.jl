# Model name: 00965_sbml_l3v2
# Number of parameters: 7
# Number of species: 0
function getODEModel_00965_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Qrun Q reset error maxrun Rrun R 

    ### Store parameters in array for ODESystem command
    parameterArray = [Qrun, Q, reset, error, maxrun, Rrun, R]

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
    Qrun => 0.0,
    Q => 0.0,
    reset => 0.0,
    error => 0.0,
    maxrun => 0.0,
    Rrun => 0.0,
    R => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
