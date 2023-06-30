# Model name: 01503_sbml_l2v4
# Number of parameters: 10
# Number of species: 0
function getODEModel_01503_sbml_l2v4()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters P6 P7 P5 P8 P2 P1 P9 P4 P10 P3 

    ### Store parameters in array for ODESystem command
    parameterArray = [P6, P7, P5, P8, P2, P1, P9, P4, P10, P3]

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
    P6 => nothing,
    P7 => nothing,
    P5 => nothing,
    P8 => nothing,
    P2 => nothing,
    P1 => nothing,
    P9 => nothing,
    P4 => nothing,
    P10 => nothing,
    P3 => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
