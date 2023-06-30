# Model name: 01502_sbml_l2v1
# Number of parameters: 36
# Number of species: 0
function getODEModel_01502_sbml_l2v1()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t 

    ### Store dependent variables in array for ODESystem command
    stateArray = [

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters P12 P18 P32 P23 P16 P6 P7 P28 P3 P22 P25 P27 P30 P34 P14 P15 P21 P4 P17 P9 P19 P31 P33 P5 P24 P26 P29 P8 P20 P35 P2 P36 P11 P37 P10 P13 

    ### Store parameters in array for ODESystem command
    parameterArray = [P12, P18, P32, P23, P16, P6, P7, P28, P3, P22, P25, P27, P30, P34, P14, P15, P21, P4, P17, P9, P19, P31, P33, P5, P24, P26, P29, P8, P20, P35, P2, P36, P11, P37, P10, P13]

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
    P12 => nothing,
    P18 => nothing,
    P32 => nothing,
    P23 => nothing,
    P16 => nothing,
    P6 => nothing,
    P7 => nothing,
    P28 => nothing,
    P3 => nothing,
    P22 => nothing,
    P25 => nothing,
    P27 => nothing,
    P30 => nothing,
    P34 => nothing,
    P14 => nothing,
    P15 => nothing,
    P21 => nothing,
    P4 => nothing,
    P17 => nothing,
    P9 => nothing,
    P19 => nothing,
    P31 => nothing,
    P33 => nothing,
    P5 => nothing,
    P24 => nothing,
    P26 => nothing,
    P29 => nothing,
    P8 => nothing,
    P20 => nothing,
    P35 => nothing,
    P2 => nothing,
    P36 => nothing,
    P11 => nothing,
    P37 => nothing,
    P10 => nothing,
    P13 => nothing
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
