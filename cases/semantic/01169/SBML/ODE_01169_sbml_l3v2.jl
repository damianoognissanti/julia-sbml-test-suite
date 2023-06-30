# Model name: 01169_sbml_l3v2
# Number of parameters: 7
# Number of species: 1
function getODEModel_01169_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t U1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [U1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Q U2 X cf extentconv R timeconv 

    ### Store parameters in array for ODESystem command
    parameterArray = [Q, U2, X, cf, extentconv, R, timeconv]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(U1) ~ X/100
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    U1 => 1.1
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    Q => nothing,
    U2 => 23.0,
    X => 15.0,
    cf => 100.0,
    extentconv => 10.0,
    R => 20.0,
    timeconv => 60.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
