# Model name: 00908_sbml_l3v1
# Number of parameters: 0
# Number of species: 2
function getODEModel_00908_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t C1(t) C2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [C1, C2]

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
    D(C1) ~ (0.15*C2)-(0.2*C1),
    D(C2) ~ (0.3*C1)-(0.1*C2)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    C1 => 1.5,
    C2 => 0.75
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
