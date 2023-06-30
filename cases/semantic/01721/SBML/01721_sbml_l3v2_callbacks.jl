function getCallbacks_01721_sbml_l3v2()

	function condition_E1(u, t, integrator)
		t == 2.5
	end

	function affect_E1!(integrator)
		integrator.p[2] = S1_stoich
	end

	cb_E1 = DiscreteCallback(condition_E1, affect_E1!, save_positions=(false, false))

	return CallbackSet(cb_E1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
