# Model name: 00909_sbml_l2v5
# Number of parameters: 0
# Number of species: 2
function getODEModel_00909_sbml_l2v5()

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
    D(C1) ~ (0.4*C1)+(0.25*C2),
    D(C2) ~ (0.15*C1)+(0.2*C2)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    C1 => 0.015,
    C2 => 0.01
    ]

    ### SBML file parameter values ###
    trueParameterValues = [

    ]

    return sys, initialSpeciesValues, trueParameterValues

end
