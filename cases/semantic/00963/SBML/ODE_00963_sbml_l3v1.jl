# Model name: 00963_sbml_l3v1
# Number of parameters: 6
# Number of species: 0
function getODEModel_00963_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters reset2 Q reset Q2 R2 R 

    ### Store parameters in array for ODESystem command
    parameterArray = [reset2, Q, reset, Q2, R2, R]

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
    reset2 => 0.0,
    Q => 0.0,
    reset => 0.0,
    Q2 => 0.0,
    R2 => 0.0,
    R => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
