# Model name: 00034_sbml_l3v1
# Number of parameters: 3
# Number of species: 1
function getODEModel_00034_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t P2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [P2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Cell k1 k2 

    ### Store parameters in array for ODESystem command
    parameterArray = [Cell, k1, k2]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(P2) ~ -1.0 * (k2*P2)+1.0 * (((0.5*k1)*(100-(2*P2)))*(99-(2*P2)))
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    P2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    Cell => nothing,
    k1 => 0.001,
    k2 => 0.01
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
