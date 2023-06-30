function getCallbacks_01719_sbml_l3v2()

	function condition_E1(u, t, integrator)
		S1_stoich == 3.3
	end

	function affect_E1!(integrator)
		integrator.p[2] = 3
	end

	cb_E1 = DiscreteCallback(condition_E1, affect_E1!, save_positions=(false, false))

	return CallbackSet(cb_E1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
