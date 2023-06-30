# Model name: 01420_sbml_l3v2
# Number of parameters: 1
# Number of species: 1
function getODEModel_01420_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t A(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [A]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters C 

    ### Store parameters in array for ODESystem command
    parameterArray = [C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(A) ~ -1.0 * ( 1 /C ) * (-1)-1.0 * ( 1 /C ) * (-1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    A => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
