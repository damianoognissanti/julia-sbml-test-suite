# Model name: 01395_sbml_l2v3
# Number of parameters: 67
# Number of species: 18
function getODEModel_01395_sbml_l2v3()

    ### Define independent and dependent variables
    ModelingToolkit.@variables t p3(t) pp1_mrna(t) pp4_mrna(t) pp8_mrna(t) pp6_mrna(t) p4(t) p5(t) pp3_mrna(t) pp9_mrna(t) p7(t) pp5_mrna(t) p9(t) p6(t) pp7_mrna(t) p2(t) p8(t) p1(t) pp2_mrna(t) 

    ### Store dependent variables in array for ODESystem command
    stateArray = [p3, pp1_mrna, pp4_mrna, pp8_mrna, pp6_mrna, p4, p5, pp3_mrna, pp9_mrna, p7, pp5_mrna, p9, p6, pp7_mrna, p2, p8, p1, pp2_mrna]

    ### Define variable parameters

    ### Define potential algebraic variables

    ### Define parameters
    ModelingToolkit.@parameters pro7_strength rbs1_strength v11_h v6_Kd v4_h v2_h v9_Kd pp1_mrna_degradation_rate p6_degradation_rate v14_Kd p7_degradation_rate pro9_strength pp9_mrna_degradation_rate v1_Kd rbs2_strength rbs9_strength pp7_mrna_degradation_rate pro6_strength p1_degradation_rate v3_Kd v15_h v1_h v15_Kd v5_Kd rbs3_strength p2_degradation_rate pro5_strength v4_Kd pro4_strength rbs7_strength p9_degradation_rate pro3_strength v9_h pp6_mrna_degradation_rate DefaultCompartment v14_h v8_Kd rbs4_strength v6_h pp2_mrna_degradation_rate pp8_mrna_degradation_rate pro1_strength v2_Kd pp4_mrna_degradation_rate p3_degradation_rate v5_h v8_h v10_h v10_Kd rbs6_strength p4_degradation_rate rbs8_strength pp3_mrna_degradation_rate pp5_mrna_degradation_rate v12_h v12_Kd v11_Kd p8_degradation_rate v7_Kd v3_h v13_h v7_h rbs5_strength v13_Kd pro8_strength pro2_strength p5_degradation_rate 

    ### Store parameters in array for ODESystem command
    parameterArray = [pro7_strength, rbs1_strength, v11_h, v6_Kd, v4_h, v2_h, v9_Kd, pp1_mrna_degradation_rate, p6_degradation_rate, v14_Kd, p7_degradation_rate, pro9_strength, pp9_mrna_degradation_rate, v1_Kd, rbs2_strength, rbs9_strength, pp7_mrna_degradation_rate, pro6_strength, p1_degradation_rate, v3_Kd, v15_h, v1_h, v15_Kd, v5_Kd, rbs3_strength, p2_degradation_rate, pro5_strength, v4_Kd, pro4_strength, rbs7_strength, p9_degradation_rate, pro3_strength, v9_h, pp6_mrna_degradation_rate, DefaultCompartment, v14_h, v8_Kd, rbs4_strength, v6_h, pp2_mrna_degradation_rate, pp8_mrna_degradation_rate, pro1_strength, v2_Kd, pp4_mrna_degradation_rate, p3_degradation_rate, v5_h, v8_h, v10_h, v10_Kd, rbs6_strength, p4_degradation_rate, rbs8_strength, pp3_mrna_degradation_rate, pp5_mrna_degradation_rate, v12_h, v12_Kd, v11_Kd, p8_degradation_rate, v7_Kd, v3_h, v13_h, v7_h, rbs5_strength, v13_Kd, pro8_strength, pro2_strength, p5_degradation_rate]

    ### Define an operator for the differentiation w.r.t. time
    D = Differential(t)

    ### Continious events ###

    ### Discrete events ###

    ### Derivatives ###
    eqs = [
    D(p3) ~ +1 * ( 1 /DefaultCompartment ) * (rbs3_strength*pp3_mrna)-1 * ( 1 /DefaultCompartment ) * (p3_degradation_rate*p3),
    D(pp1_mrna) ~ -1 * ( 1 /DefaultCompartment ) * (pp1_mrna_degradation_rate*pp1_mrna)+1 * ( 1 /DefaultCompartment ) * ((pro1_strength)),
    D(pp4_mrna) ~ -1 * ( 1 /DefaultCompartment ) * (pp4_mrna_degradation_rate*pp4_mrna)+1 * ( 1 /DefaultCompartment ) * (((pro4_strength*rs7)*rs6)),
    D(pp8_mrna) ~ +1 * ( 1 /DefaultCompartment ) * (((pro8_strength*as5)*rs4))-1 * ( 1 /DefaultCompartment ) * (pp8_mrna_degradation_rate*pp8_mrna),
    D(pp6_mrna) ~ -1 * ( 1 /DefaultCompartment ) * (pp6_mrna_degradation_rate*pp6_mrna)+1 * ( 1 /DefaultCompartment ) * ((pro6_strength*(as3+as4))),
    D(p4) ~ +1 * ( 1 /DefaultCompartment ) * (rbs4_strength*pp4_mrna)-1 * ( 1 /DefaultCompartment ) * (p4_degradation_rate*p4),
    D(p5) ~ -1 * ( 1 /DefaultCompartment ) * (p5_degradation_rate*p5)+1 * ( 1 /DefaultCompartment ) * (rbs5_strength*pp5_mrna),
    D(pp3_mrna) ~ +1 * ( 1 /DefaultCompartment ) * (((pro3_strength*rs2)*rs3))-1 * ( 1 /DefaultCompartment ) * (pp3_mrna_degradation_rate*pp3_mrna),
    D(pp9_mrna) ~ +1 * ( 1 /DefaultCompartment ) * (((pro9_strength*as6)*rs5))-1 * ( 1 /DefaultCompartment ) * (pp9_mrna_degradation_rate*pp9_mrna),
    D(p7) ~ -1 * ( 1 /DefaultCompartment ) * (p7_degradation_rate*p7)+1 * ( 1 /DefaultCompartment ) * (rbs7_strength*pp7_mrna),
    D(pp5_mrna) ~ -1 * ( 1 /DefaultCompartment ) * (pp5_mrna_degradation_rate*pp5_mrna)+1 * ( 1 /DefaultCompartment ) * ((pro5_strength*as2)),
    D(p9) ~ +1 * ( 1 /DefaultCompartment ) * (rbs9_strength*pp9_mrna)-1 * ( 1 /DefaultCompartment ) * (p9_degradation_rate*p9),
    D(p6) ~ -1 * ( 1 /DefaultCompartment ) * (p6_degradation_rate*p6)+1 * ( 1 /DefaultCompartment ) * (rbs6_strength*pp6_mrna),
    D(pp7_mrna) ~ -1 * ( 1 /DefaultCompartment ) * (pp7_mrna_degradation_rate*pp7_mrna)+1 * ( 1 /DefaultCompartment ) * ((pro7_strength*(as7+(((1+((p5/v9_Kd)^v9_h))-1)/(1+((p5/v9_Kd)^v9_h)))))),
    D(p2) ~ -1 * ( 1 /DefaultCompartment ) * (p2_degradation_rate*p2)+1 * ( 1 /DefaultCompartment ) * (rbs2_strength*pp2_mrna),
    D(p8) ~ -1 * ( 1 /DefaultCompartment ) * (p8_degradation_rate*p8)+1 * ( 1 /DefaultCompartment ) * (rbs8_strength*pp8_mrna),
    D(p1) ~ +1 * ( 1 /DefaultCompartment ) * (rbs1_strength*pp1_mrna)-1 * ( 1 /DefaultCompartment ) * (p1_degradation_rate*p1),
    D(pp2_mrna) ~ +1 * ( 1 /DefaultCompartment ) * (((pro2_strength*as1)*rs1))-1 * ( 1 /DefaultCompartment ) * (pp2_mrna_degradation_rate*pp2_mrna)
    ]

    @named sys = ODESystem(eqs, t, stateArray, parameterArray)

    ### Initial species concentrations ###
    initialSpeciesValues = [
    p3 => 0.0,
    pp1_mrna => 0.0,
    pp4_mrna => 0.0,
    pp8_mrna => 0.0,
    pp6_mrna => 0.0,
    p4 => 0.0,
    p5 => 0.0,
    pp3_mrna => 0.0,
    pp9_mrna => 0.0,
    p7 => 0.0,
    pp5_mrna => 0.0,
    p9 => 0.0,
    p6 => 0.0,
    pp7_mrna => 0.0,
    p2 => 0.0,
    p8 => 0.0,
    p1 => 5.0,
    pp2_mrna => 0.0
    ]

    ### SBML file parameter values ###
    trueParameterValues = [
    pro7_strength => 1.31,
    rbs1_strength => 0.3668,
    v11_h => 2.0,
    v6_Kd => 0.04,
    v4_h => 4.0,
    v2_h => 4.0,
    v9_Kd => 0.2,
    pp1_mrna_degradation_rate => 1.0,
    p6_degradation_rate => 0.5,
    v14_Kd => 1.0,
    p7_degradation_rate => 0.5,
    pro9_strength => 5.0,
    pp9_mrna_degradation_rate => 1.0,
    v1_Kd => 11.147,
    rbs2_strength => 1.4102,
    rbs9_strength => 8.0,
    pp7_mrna_degradation_rate => 1.0,
    pro6_strength => 1.31,
    p1_degradation_rate => 0.5,
    v3_Kd => 20.0,
    v15_h => 1.0,
    v1_h => 1.0,
    v15_Kd => 20.0,
    v5_Kd => 0.2,
    rbs3_strength => 0.8,
    p2_degradation_rate => 0.5,
    pro5_strength => 5.0,
    v4_Kd => 0.2,
    pro4_strength => 5.0,
    rbs7_strength => 5.0,
    p9_degradation_rate => 0.5,
    pro3_strength => 5.0,
    v9_h => 4.0,
    pp6_mrna_degradation_rate => 1.0,
    DefaultCompartment => 1.0,
    v14_h => 4.0,
    v8_Kd => 0.04,
    rbs4_strength => 2.21,
    v6_h => 4.0,
    pp2_mrna_degradation_rate => 1.0,
    pp8_mrna_degradation_rate => 1.0,
    pro1_strength => 2.0,
    v2_Kd => 1.0,
    pp4_mrna_degradation_rate => 1.0,
    p3_degradation_rate => 0.5,
    v5_h => 4.0,
    v8_h => 4.0,
    v10_h => 4.0,
    v10_Kd => 0.02,
    rbs6_strength => 2.0,
    p4_degradation_rate => 0.5,
    rbs8_strength => 3.6377,
    pp3_mrna_degradation_rate => 1.0,
    pp5_mrna_degradation_rate => 1.0,
    v12_h => 2.0,
    v12_Kd => 0.1,
    v11_Kd => 0.1,
    p8_degradation_rate => 0.5,
    v7_Kd => 0.02,
    v3_h => 1.0,
    v13_h => 2.0,
    v7_h => 4.0,
    rbs5_strength => 0.5,
    v13_Kd => 0.01,
    pro8_strength => 5.0,
    pro2_strength => 4.5077,
    p5_degradation_rate => 0.5
    ]

    return sys, initialSpeciesValues, trueParameterValues

end
