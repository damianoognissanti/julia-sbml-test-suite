function getCallbacks_01577_sbml_l3v1()

	function condition_E0(u, t, integrator)
		t == 4.5
	end

	function affect_E0!(integrator)
		integrator.p[1] = 3
	end

	cb_E0 = DiscreteCallback(condition_E0, affect_E0!, save_positions=(false, false))


	function condition_E1(u, t, integrator)
		t == 4.5
	end

	function affect_E1!(integrator)
		integrator.p[1] = 5
	end

	cb_E1 = DiscreteCallback(condition_E1, affect_E1!, save_positions=(false, false))

	return CallbackSet(cb_E0, cb_E1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
