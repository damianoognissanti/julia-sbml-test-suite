# Model name: 01807_sbml_l2v3
# Number of parameters: 2
# Number of species: 3
function getODEModel_01807_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t spec(t) sPeC(t) Spec(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [spec, sPeC, Spec]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters c C 

    ### Store parameters in array for ODESystem command
    parameterArray = [c, C]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(spec) ~ +1 * ( 1 /C ) * (1),
    D(sPeC) ~ +2.0 * ( 1 /C ) * (2),
    D(Spec) ~ +1 * ( 1 /c ) * (2)
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
    c => 2.0,
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
