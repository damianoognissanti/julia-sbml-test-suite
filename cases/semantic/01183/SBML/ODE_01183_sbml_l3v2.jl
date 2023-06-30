# Model name: 01183_sbml_l3v2
# Number of parameters: 4
# Number of species: 1
function getODEModel_01183_sbml_l3v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t s1(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [s1]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters extentpertimeconv C extentconv timeconv 

    ### Store parameters in array for ODESystem command
    parameterArray = [extentpertimeconv, C, extentconv, timeconv]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(s1) ~ +1.0 * (10)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    s1 => 1.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    extentpertimeconv => 16.6666666666667,
    C => 1.0,
    extentconv => 1000.0,
    timeconv => 60.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
