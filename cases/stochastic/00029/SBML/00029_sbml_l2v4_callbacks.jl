function getCallbacks_00029_sbml_l2v4()

	function condition_reset(u, t, integrator)
		t == 22.5
	end

	function affect_reset!(integrator)
		integrator.u[1] = 20
	end

	cb_reset = DiscreteCallback(condition_reset, affect_reset!, save_positions=(false, false))

	return CallbackSet(cb_reset), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
