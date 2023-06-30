# Model name: 01532_sbml_l2v5
# Number of parameters: 53
# Number of species: 1
function getODEModel_01532_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t trig(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [trig]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters P21 P50 P17 P33 P26 P2 P47 P44 P32 P38 P49 P16 P7 P28 P22 P27 P48 P51 P14 P15 P42 P20 P35 P1 P36 P46 P37 P18 P23 P6 P3 P0 P25 P4 P19 P9 P24 P29 P41 P11 P10 P13 P30 P34 P31 P40 P52 P5 P8 P39 P45 P43 P12 

    ### Store parameters in array for ODESystem command
    parameterArray = [P21, P50, P17, P33, P26, P2, P47, P44, P32, P38, P49, P16, P7, P28, P22, P27, P48, P51, P14, P15, P42, P20, P35, P1, P36, P46, P37, P18, P23, P6, P3, P0, P25, P4, P19, P9, P24, P29, P41, P11, P10, P13, P30, P34, P31, P40, P52, P5, P8, P39, P45, P43, P12]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(trig) ~ 1
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    trig => -5.3
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    P21 => 0.0,
    P50 => 0.0,
    P17 => 0.0,
    P33 => 0.0,
    P26 => 0.0,
    P2 => 0.0,
    P47 => 0.0,
    P44 => 0.0,
    P32 => 0.0,
    P38 => 0.0,
    P49 => 0.0,
    P16 => 0.0,
    P7 => 0.0,
    P28 => 0.0,
    P22 => 0.0,
    P27 => 0.0,
    P48 => 0.0,
    P51 => 0.0,
    P14 => 0.0,
    P15 => 0.0,
    P42 => 0.0,
    P20 => 0.0,
    P35 => 0.0,
    P1 => 0.0,
    P36 => 0.0,
    P46 => 0.0,
    P37 => 0.0,
    P18 => 0.0,
    P23 => 0.0,
    P6 => 0.0,
    P3 => 0.0,
    P0 => 0.0,
    P25 => 0.0,
    P4 => 0.0,
    P19 => 0.0,
    P9 => 0.0,
    P24 => 0.0,
    P29 => 0.0,
    P41 => 0.0,
    P11 => 0.0,
    P10 => 0.0,
    P13 => 0.0,
    P30 => 0.0,
    P34 => 0.0,
    P31 => 0.0,
    P40 => 0.0,
    P52 => 0.0,
    P5 => 0.0,
    P8 => 0.0,
    P39 => 0.0,
    P45 => 0.0,
    P43 => 0.0,
    P12 => 0.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
