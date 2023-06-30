# Model name: 00891_sbml_l3v2
# Number of parameters: 1
# Number of species: 2
function getODEModel_00891_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t k1(t) k2(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [k1, k2]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters k3 

    ### Store parameters in array for ODESystem command
    parameterArray = [k3]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(k1) ~ ((-1*k1)*k3)*t,
    D(k2) ~ (k1*k3)*t
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    k1 => 0.00015,
    k2 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    k3 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
