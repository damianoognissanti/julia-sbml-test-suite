# Model name: 01562_sbml_l2v5
# Number of parameters: 1
# Number of species: 52
function getODEModel_01562_sbml_l2v5()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t S13(t) S17(t) S39(t) S4(t) S37(t) S19(t) S2(t) S42(t) S26(t) S51(t) S15(t) S48(t) S34(t) S22(t) S11(t) S14(t) S36(t) S33(t) S8(t) S7(t) S32(t) S25(t) S1(t) S45(t) S46(t) S21(t) S47(t) S29(t) S20(t) S41(t) S24(t) S18(t) S50(t) S9(t) S30(t) S43(t) S23(t) S31(t) S10(t) S12(t) S49(t) S16(t) S38(t) S28(t) S5(t) S40(t) S3(t) S27(t) S0(t) S44(t) S6(t) S35(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [S13, S17, S39, S4, S37, S19, S2, S42, S26, S51, S15, S48, S34, S22, S11, S14, S36, S33, S8, S7, S32, S25, S1, S45, S46, S21, S47, S29, S20, S41, S24, S18, S50, S9, S30, S43, S23, S31, S10, S12, S49, S16, S38, S28, S5, S40, S3, S27, S0, S44, S6, S35]

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
    D(S13) ~ +1 * ( 1 /C ) * (1),
    D(S17) ~ +1 * ( 1 /C ) * (1),
    D(S39) ~ +1 * ( 1 /C ) * (1),
    D(S4) ~ +1 * ( 1 /C ) * (1),
    D(S37) ~ +1 * ( 1 /C ) * (1),
    D(S19) ~ +1 * ( 1 /C ) * (1),
    D(S2) ~ +1 * ( 1 /C ) * (1),
    D(S42) ~ +1 * ( 1 /C ) * (1),
    D(S26) ~ +1 * ( 1 /C ) * (1),
    D(S51) ~ +1 * ( 1 /C ) * (1),
    D(S15) ~ +1 * ( 1 /C ) * (1),
    D(S48) ~ +1 * ( 1 /C ) * (1),
    D(S34) ~ +1 * ( 1 /C ) * (1),
    D(S22) ~ +1 * ( 1 /C ) * (1),
    D(S11) ~ +1 * ( 1 /C ) * (1),
    D(S14) ~ +1 * ( 1 /C ) * (1),
    D(S36) ~ +1 * ( 1 /C ) * (1),
    D(S33) ~ +1 * ( 1 /C ) * (1),
    D(S8) ~ +1 * ( 1 /C ) * (1),
    D(S7) ~ +1 * ( 1 /C ) * (1),
    D(S32) ~ +1 * ( 1 /C ) * (1),
    D(S25) ~ +1 * ( 1 /C ) * (1),
    D(S1) ~ +1 * ( 1 /C ) * (1),
    D(S45) ~ +1 * ( 1 /C ) * (1),
    D(S46) ~ +1 * ( 1 /C ) * (1),
    D(S21) ~ +1 * ( 1 /C ) * (1),
    D(S47) ~ +1 * ( 1 /C ) * (1),
    D(S29) ~ +1 * ( 1 /C ) * (1),
    D(S20) ~ +1 * ( 1 /C ) * (1),
    D(S41) ~ +1 * ( 1 /C ) * (1),
    D(S24) ~ +1 * ( 1 /C ) * (1),
    D(S18) ~ +1 * ( 1 /C ) * (1),
    D(S50) ~ +1 * ( 1 /C ) * (1),
    D(S9) ~ +1 * ( 1 /C ) * (1),
    D(S30) ~ +1 * ( 1 /C ) * (1),
    D(S43) ~ +1 * ( 1 /C ) * (1),
    D(S23) ~ +1 * ( 1 /C ) * (1),
    D(S31) ~ +1 * ( 1 /C ) * (1),
    D(S10) ~ +1 * ( 1 /C ) * (1),
    D(S12) ~ +1 * ( 1 /C ) * (1),
    D(S49) ~ +1 * ( 1 /C ) * (1),
    D(S16) ~ +1 * ( 1 /C ) * (1),
    D(S38) ~ +1 * ( 1 /C ) * (1),
    D(S28) ~ +1 * ( 1 /C ) * (1),
    D(S5) ~ +1 * ( 1 /C ) * (1),
    D(S40) ~ +1 * ( 1 /C ) * (1),
    D(S3) ~ +1 * ( 1 /C ) * (1),
    D(S27) ~ +1 * ( 1 /C ) * (1),
    D(S0) ~ +1 * ( 1 /C ) * (1),
    D(S44) ~ +1 * ( 1 /C ) * (1),
    D(S6) ~ +1 * ( 1 /C ) * (1),
    D(S35) ~ +1 * ( 1 /C ) * (1)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    S13 => 0.0,
    S17 => 0.0,
    S39 => 0.0,
    S4 => 0.0,
    S37 => 0.0,
    S19 => 0.0,
    S2 => 0.0,
    S42 => 0.0,
    S26 => 0.0,
    S51 => 0.0,
    S15 => 0.0,
    S48 => 0.0,
    S34 => 0.0,
    S22 => 0.0,
    S11 => 0.0,
    S14 => 0.0,
    S36 => 0.0,
    S33 => 0.0,
    S8 => 0.0,
    S7 => 0.0,
    S32 => 0.0,
    S25 => 0.0,
    S1 => 0.0,
    S45 => 0.0,
    S46 => 0.0,
    S21 => 0.0,
    S47 => 0.0,
    S29 => 0.0,
    S20 => 0.0,
    S41 => 0.0,
    S24 => 0.0,
    S18 => 0.0,
    S50 => 0.0,
    S9 => 0.0,
    S30 => 0.0,
    S43 => 0.0,
    S23 => 0.0,
    S31 => 0.0,
    S10 => 0.0,
    S12 => 0.0,
    S49 => 0.0,
    S16 => 0.0,
    S38 => 0.0,
    S28 => 0.0,
    S5 => 0.0,
    S40 => 0.0,
    S3 => 0.0,
    S27 => 0.0,
    S0 => 0.0,
    S44 => 0.0,
    S6 => 0.0,
    S35 => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    C => 1.0
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
