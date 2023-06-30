# Model name: 01804_sbml_l2v5
# Number of parameters: 1
# Number of species: 3
function getODEModel_01804_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t spec(t) sPeC(t) Spec(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [spec, sPeC, Spec]

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
    D(spec) ~ 0.0,
    D(sPeC) ~ 0.0,
    D(Spec) ~ 0.0
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    spec => 3.0,
    sPeC => 5.0,
    Spec => 4.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
