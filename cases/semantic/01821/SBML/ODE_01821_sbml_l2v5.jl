# Model name: 01821_sbml_l2v5
# Number of parameters: 7
# Number of species: 0
function getODEModel_01821_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters TIME c time b Time a d 

    ### Store parameters in array for ODESystem command
    parameterArray = [TIME, c, time, b, Time, a, d]

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
    TIME => 12.0,
    c => TIME,
    time => 10.0,
    b => Time,
    Time => 11.0,
    a => time,
    d => time
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
