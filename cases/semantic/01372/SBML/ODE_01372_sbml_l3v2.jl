# Model name: 01372_sbml_l3v2
# Number of parameters: 1
# Number of species: 1
function getODEModel_01372_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t J1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [J1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters A_C 

    ### Store parameters in array for ODESystem command
    parameterArray = [A_C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(J1) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    J1 => 5.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    A_C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
