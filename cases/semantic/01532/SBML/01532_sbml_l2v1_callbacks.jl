function getCallbacks_01532_sbml_l2v1()

	function condition_E50(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E50!(integrator)
		integrator.p[2] = 2
	end

	cb_E50 = ContinuousCallback(condition_E50, affect_E50!, save_positions=(false, false))


	function condition_E29(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E29!(integrator)
		integrator.p[38] = 2
	end

	cb_E29 = ContinuousCallback(condition_E29, affect_E29!, save_positions=(false, false))


	function condition_E52(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E52!(integrator)
		integrator.p[47] = 2
	end

	cb_E52 = ContinuousCallback(condition_E52, affect_E52!, save_positions=(false, false))


	function condition_E38(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E38!(integrator)
		integrator.p[10] = 2
	end

	cb_E38 = ContinuousCallback(condition_E38, affect_E38!, save_positions=(false, false))


	function condition_E18(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E18!(integrator)
		integrator.p[28] = 2
	end

	cb_E18 = ContinuousCallback(condition_E18, affect_E18!, save_positions=(false, false))


	function condition_E10(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E10!(integrator)
		integrator.p[41] = 2
	end

	cb_E10 = ContinuousCallback(condition_E10, affect_E10!, save_positions=(false, false))


	function condition_E19(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E19!(integrator)
		integrator.p[35] = 2
	end

	cb_E19 = ContinuousCallback(condition_E19, affect_E19!, save_positions=(false, false))


	function condition_E51(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E51!(integrator)
		integrator.p[18] = 2
	end

	cb_E51 = ContinuousCallback(condition_E51, affect_E51!, save_positions=(false, false))


	function condition_E35(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E35!(integrator)
		integrator.p[23] = 2
	end

	cb_E35 = ContinuousCallback(condition_E35, affect_E35!, save_positions=(false, false))


	function condition_E16(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E16!(integrator)
		integrator.p[12] = 2
	end

	cb_E16 = ContinuousCallback(condition_E16, affect_E16!, save_positions=(false, false))


	function condition_E47(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E47!(integrator)
		integrator.p[7] = 2
	end

	cb_E47 = ContinuousCallback(condition_E47, affect_E47!, save_positions=(false, false))


	function condition_E40(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E40!(integrator)
		integrator.p[46] = 2
	end

	cb_E40 = ContinuousCallback(condition_E40, affect_E40!, save_positions=(false, false))


	function condition_E27(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E27!(integrator)
		integrator.p[16] = 2
	end

	cb_E27 = ContinuousCallback(condition_E27, affect_E27!, save_positions=(false, false))


	function condition_E22(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E22!(integrator)
		integrator.p[15] = 2
	end

	cb_E22 = ContinuousCallback(condition_E22, affect_E22!, save_positions=(false, false))


	function condition_E13(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E13!(integrator)
		integrator.p[42] = 2
	end

	cb_E13 = ContinuousCallback(condition_E13, affect_E13!, save_positions=(false, false))


	function condition_E25(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E25!(integrator)
		integrator.p[33] = 2
	end

	cb_E25 = ContinuousCallback(condition_E25, affect_E25!, save_positions=(false, false))


	function condition_E6(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E6!(integrator)
		integrator.p[30] = 2
	end

	cb_E6 = ContinuousCallback(condition_E6, affect_E6!, save_positions=(false, false))


	function condition_E37(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E37!(integrator)
		integrator.p[27] = 2
	end

	cb_E37 = ContinuousCallback(condition_E37, affect_E37!, save_positions=(false, false))


	function condition_E30(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E30!(integrator)
		integrator.p[43] = 2
	end

	cb_E30 = ContinuousCallback(condition_E30, affect_E30!, save_positions=(false, false))


	function condition_E1(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E1!(integrator)
		integrator.p[24] = 2
	end

	cb_E1 = ContinuousCallback(condition_E1, affect_E1!, save_positions=(false, false))


	function condition_E28(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E28!(integrator)
		integrator.p[14] = 2
	end

	cb_E28 = ContinuousCallback(condition_E28, affect_E28!, save_positions=(false, false))


	function condition_E20(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E20!(integrator)
		integrator.p[22] = 2
	end

	cb_E20 = ContinuousCallback(condition_E20, affect_E20!, save_positions=(false, false))


	function condition_E23(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E23!(integrator)
		integrator.p[29] = 2
	end

	cb_E23 = ContinuousCallback(condition_E23, affect_E23!, save_positions=(false, false))


	function condition_E34(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E34!(integrator)
		integrator.p[44] = 2
	end

	cb_E34 = ContinuousCallback(condition_E34, affect_E34!, save_positions=(false, false))


	function condition_E41(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E41!(integrator)
		integrator.p[39] = 2
	end

	cb_E41 = ContinuousCallback(condition_E41, affect_E41!, save_positions=(false, false))


	function condition_E5(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E5!(integrator)
		integrator.p[48] = 2
	end

	cb_E5 = ContinuousCallback(condition_E5, affect_E5!, save_positions=(false, false))


	function condition_E31(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E31!(integrator)
		integrator.p[45] = 2
	end

	cb_E31 = ContinuousCallback(condition_E31, affect_E31!, save_positions=(false, false))


	function condition_E12(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E12!(integrator)
		integrator.p[53] = 2
	end

	cb_E12 = ContinuousCallback(condition_E12, affect_E12!, save_positions=(false, false))


	function condition_E11(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E11!(integrator)
		integrator.p[40] = 2
	end

	cb_E11 = ContinuousCallback(condition_E11, affect_E11!, save_positions=(false, false))


	function condition_E42(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E42!(integrator)
		integrator.p[21] = 2
	end

	cb_E42 = ContinuousCallback(condition_E42, affect_E42!, save_positions=(false, false))


	function condition_E48(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E48!(integrator)
		integrator.p[17] = 2
	end

	cb_E48 = ContinuousCallback(condition_E48, affect_E48!, save_positions=(false, false))


	function condition_E33(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E33!(integrator)
		integrator.p[4] = 2
	end

	cb_E33 = ContinuousCallback(condition_E33, affect_E33!, save_positions=(false, false))


	function condition_E8(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E8!(integrator)
		integrator.p[49] = 2
	end

	cb_E8 = ContinuousCallback(condition_E8, affect_E8!, save_positions=(false, false))


	function condition_E21(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E21!(integrator)
		integrator.p[1] = 2
	end

	cb_E21 = ContinuousCallback(condition_E21, affect_E21!, save_positions=(false, false))


	function condition_E49(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E49!(integrator)
		integrator.p[11] = 2
	end

	cb_E49 = ContinuousCallback(condition_E49, affect_E49!, save_positions=(false, false))


	function condition_E45(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E45!(integrator)
		integrator.p[51] = 2
	end

	cb_E45 = ContinuousCallback(condition_E45, affect_E45!, save_positions=(false, false))


	function condition_E46(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E46!(integrator)
		integrator.p[26] = 2
	end

	cb_E46 = ContinuousCallback(condition_E46, affect_E46!, save_positions=(false, false))


	function condition_E39(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E39!(integrator)
		integrator.p[50] = 2
	end

	cb_E39 = ContinuousCallback(condition_E39, affect_E39!, save_positions=(false, false))


	function condition_E7(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E7!(integrator)
		integrator.p[13] = 2
	end

	cb_E7 = ContinuousCallback(condition_E7, affect_E7!, save_positions=(false, false))


	function condition_E36(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E36!(integrator)
		integrator.p[25] = 2
	end

	cb_E36 = ContinuousCallback(condition_E36, affect_E36!, save_positions=(false, false))


	function condition_E24(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E24!(integrator)
		integrator.p[37] = 2
	end

	cb_E24 = ContinuousCallback(condition_E24, affect_E24!, save_positions=(false, false))


	function condition_E14(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E14!(integrator)
		integrator.p[19] = 2
	end

	cb_E14 = ContinuousCallback(condition_E14, affect_E14!, save_positions=(false, false))


	function condition_E44(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E44!(integrator)
		integrator.p[8] = 2
	end

	cb_E44 = ContinuousCallback(condition_E44, affect_E44!, save_positions=(false, false))


	function condition_E4(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E4!(integrator)
		integrator.p[34] = 2
	end

	cb_E4 = ContinuousCallback(condition_E4, affect_E4!, save_positions=(false, false))


	function condition_E9(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E9!(integrator)
		integrator.p[36] = 2
	end

	cb_E9 = ContinuousCallback(condition_E9, affect_E9!, save_positions=(false, false))


	function condition_E26(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E26!(integrator)
		integrator.p[5] = 2
	end

	cb_E26 = ContinuousCallback(condition_E26, affect_E26!, save_positions=(false, false))


	function condition_E3(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E3!(integrator)
		integrator.p[31] = 2
	end

	cb_E3 = ContinuousCallback(condition_E3, affect_E3!, save_positions=(false, false))


	function condition_E2(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E2!(integrator)
		integrator.p[6] = 2
	end

	cb_E2 = ContinuousCallback(condition_E2, affect_E2!, save_positions=(false, false))


	function condition_E32(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E32!(integrator)
		integrator.p[9] = 2
	end

	cb_E32 = ContinuousCallback(condition_E32, affect_E32!, save_positions=(false, false))


	function condition_E43(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E43!(integrator)
		integrator.p[52] = 2
	end

	cb_E43 = ContinuousCallback(condition_E43, affect_E43!, save_positions=(false, false))


	function condition_E0(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E0!(integrator)
		integrator.p[32] = 2
	end

	cb_E0 = ContinuousCallback(condition_E0, affect_E0!, save_positions=(false, false))


	function condition_E15(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E15!(integrator)
		integrator.p[20] = 2
	end

	cb_E15 = ContinuousCallback(condition_E15, affect_E15!, save_positions=(false, false))


	function condition_E17(u, t, integrator)
		u[1] ≥ -5.2
	end

	function affect_E17!(integrator)
		integrator.p[3] = 2
	end

	cb_E17 = ContinuousCallback(condition_E17, affect_E17!, save_positions=(false, false))

	return CallbackSet(cb_E50, cb_E29, cb_E52, cb_E38, cb_E18, cb_E10, cb_E19, cb_E51, cb_E35, cb_E16, cb_E47, cb_E40, cb_E27, cb_E22, cb_E13, cb_E25, cb_E6, cb_E37, cb_E30, cb_E1, cb_E28, cb_E20, cb_E23, cb_E34, cb_E41, cb_E5, cb_E31, cb_E12, cb_E11, cb_E42, cb_E48, cb_E33, cb_E8, cb_E21, cb_E49, cb_E45, cb_E46, cb_E39, cb_E7, cb_E36, cb_E24, cb_E14, cb_E44, cb_E4, cb_E9, cb_E26, cb_E3, cb_E2, cb_E32, cb_E43, cb_E0, cb_E15, cb_E17), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
