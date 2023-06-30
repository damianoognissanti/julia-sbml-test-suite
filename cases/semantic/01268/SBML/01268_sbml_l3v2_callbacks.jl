function getCallbacks_01268_sbml_l3v2()

	function condition_E0(u, t, integrator)
		t == 5.9
	end

	function affect_E0!(integrator)
		integrator.p[1] = 5
	end

	cb_E0 = DiscreteCallback(condition_E0, affect_E0!, save_positions=(false, false))

	return CallbackSet(cb_E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
