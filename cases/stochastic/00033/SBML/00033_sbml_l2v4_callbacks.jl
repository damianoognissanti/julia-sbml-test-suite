function getCallbacks_00033_sbml_l2v4()

	function condition_reset(u, t, integrator)
		u[2] ≥ 30
	end

	function affect_reset!(integrator)
		integrator.u[1] = 100
		integrator.u[2] = 0
	end

	cb_reset = ContinuousCallback(condition_reset, affect_reset!, save_positions=(false, false))

	return CallbackSet(cb_reset), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
