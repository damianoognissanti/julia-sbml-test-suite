function getCallbacks_01326_sbml_l2v4()

	function condition_E0(u, t, integrator)
		u[1] ≥ 3.5
	end

	function affect_E0!(integrator)
		integrator.p[2] = integrator.u[1]
	end

	cb_E0 = ContinuousCallback(condition_E0, affect_E0!, save_positions=(false, false))

	return CallbackSet(cb_E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
