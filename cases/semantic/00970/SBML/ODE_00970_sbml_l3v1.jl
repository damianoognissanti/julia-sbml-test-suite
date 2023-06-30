# Model name: 00970_sbml_l3v1
# Number of parameters: 3
# Number of species: 1
function getODEModel_00970_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t X(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [X]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters Xref default_compartment k1 

    ### Store parameters in array for ODESystem command
    parameterArray = [Xref, default_compartment, k1]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(X) ~ +1 * ( 1 /default_compartment ) * (k1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    X => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    Xref => 3.0,
    default_compartment => 1.0,
    k1 => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
