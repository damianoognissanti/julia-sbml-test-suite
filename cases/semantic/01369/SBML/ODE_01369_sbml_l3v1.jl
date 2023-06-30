# Model name: 01369_sbml_l3v1
# Number of parameters: 2
# Number of species: 1
function getODEModel_01369_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters J1 C 

    ### Store parameters in array for ODESystem command
    parameterArray = [J1, C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(S1) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S1 => 3.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    J1 => 5.0,
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
