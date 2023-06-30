# Model name: 00951_sbml_l1v2
# Number of parameters: 4
# Number of species: 0
function getODEModel_00951_sbml_l1v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Q c P R 

    ### Store parameters in array for ODESystem command
    parameterArray = [Q, c, P, R]

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
    Q => -Inf,
    c => 1.0,
    P => Inf,
    R => NaN
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
