function getCallbacks_00028_sbml_l2v1()

	function condition_reset(u, t, integrator)
		t == 25
	end

	function affect_reset!(integrator)
		integrator.u[1] = 50
	end

	cb_reset = DiscreteCallback(condition_reset, affect_reset!, save_positions=(false, false))

	return CallbackSet(cb_reset), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
