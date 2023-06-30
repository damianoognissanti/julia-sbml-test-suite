# Model name: 00942_sbml_l3v1
# Number of parameters: 1
# Number of species: 1
function getODEModel_00942_sbml_l3v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t x(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [x]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters default_compartment 

    ### Store parameters in array for ODESystem command
    parameterArray = [default_compartment]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(x) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    x => 1*sin(10*time)
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    default_compartment => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
