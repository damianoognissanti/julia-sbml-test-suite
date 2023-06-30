# Model name: 01517_sbml_l2v2
# Number of parameters: 1
# Number of species: 38
function getODEModel_01517_sbml_l2v2()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t P12(t) P18(t) P32(t) P23(t) P38(t) P16(t) P6(t) P7(t) P28(t) P3(t) P22(t) P25(t) P27(t) P30(t) P34(t) P14(t) P15(t) P21(t) P4(t) P17(t) P9(t) P19(t) P31(t) P33(t) P5(t) P24(t) P26(t) P29(t) P8(t) P20(t) P35(t) P2(t) P36(t) P39(t) P11(t) P37(t) P10(t) P13(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [P12, P18, P32, P23, P38, P16, P6, P7, P28, P3, P22, P25, P27, P30, P34, P14, P15, P21, P4, P17, P9, P19, P31, P33, P5, P24, P26, P29, P8, P20, P35, P2, P36, P39, P11, P37, P10, P13]

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
    D(P12) ~ +1 * ( 1 /C ) * (1),
    D(P18) ~ +1 * ( 1 /C ) * (1),
    D(P32) ~ +1 * ( 1 /C ) * (1),
    D(P23) ~ +1 * ( 1 /C ) * (1),
    D(P38) ~ +1 * ( 1 /C ) * (1),
    D(P16) ~ +1 * ( 1 /C ) * (1),
    D(P6) ~ +1 * ( 1 /C ) * (1),
    D(P7) ~ +1 * ( 1 /C ) * (1),
    D(P28) ~ +1 * ( 1 /C ) * (1),
    D(P3) ~ +1 * ( 1 /C ) * (1),
    D(P22) ~ +1 * ( 1 /C ) * (1),
    D(P25) ~ +1 * ( 1 /C ) * (1),
    D(P27) ~ +1 * ( 1 /C ) * (1),
    D(P30) ~ +1 * ( 1 /C ) * (1),
    D(P34) ~ +1 * ( 1 /C ) * (1),
    D(P14) ~ +1 * ( 1 /C ) * (1),
    D(P15) ~ +1 * ( 1 /C ) * (1),
    D(P21) ~ +1 * ( 1 /C ) * (1),
    D(P4) ~ +1 * ( 1 /C ) * (1),
    D(P17) ~ +1 * ( 1 /C ) * (1),
    D(P9) ~ +1 * ( 1 /C ) * (1),
    D(P19) ~ +1 * ( 1 /C ) * (1),
    D(P31) ~ +1 * ( 1 /C ) * (1),
    D(P33) ~ +1 * ( 1 /C ) * (1),
    D(P5) ~ +1 * ( 1 /C ) * (1),
    D(P24) ~ +1 * ( 1 /C ) * (1),
    D(P26) ~ +1 * ( 1 /C ) * (1),
    D(P29) ~ +1 * ( 1 /C ) * (1),
    D(P8) ~ +1 * ( 1 /C ) * (1),
    D(P20) ~ +1 * ( 1 /C ) * (1),
    D(P35) ~ +1 * ( 1 /C ) * (1),
    D(P2) ~ +1 * ( 1 /C ) * (1),
    D(P36) ~ +1 * ( 1 /C ) * (1),
    D(P39) ~ +1 * ( 1 /C ) * (1),
    D(P11) ~ +1 * ( 1 /C ) * (1),
    D(P37) ~ +1 * ( 1 /C ) * (1),
    D(P10) ~ +1 * ( 1 /C ) * (1),
    D(P13) ~ +1 * ( 1 /C ) * (1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    P12 => 0.0,
    P18 => 0.0,
    P32 => 0.0,
    P23 => 0.0,
    P38 => 0.0,
    P16 => 0.0,
    P6 => 0.0,
    P7 => 0.0,
    P28 => 0.0,
    P3 => 0.0,
    P22 => 0.0,
    P25 => 0.0,
    P27 => 0.0,
    P30 => 0.0,
    P34 => 0.0,
    P14 => 0.0,
    P15 => 0.0,
    P21 => 0.0,
    P4 => 0.0,
    P17 => 0.0,
    P9 => 0.0,
    P19 => 0.0,
    P31 => 0.0,
    P33 => 0.0,
    P5 => 0.0,
    P24 => 0.0,
    P26 => 0.0,
    P29 => 0.0,
    P8 => 0.0,
    P20 => 0.0,
    P35 => 0.0,
    P2 => 0.0,
    P36 => 0.0,
    P39 => 0.0,
    P11 => 0.0,
    P37 => 0.0,
    P10 => 0.0,
    P13 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
