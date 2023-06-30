function getCallbacks_01579_sbml_l2v5()

	function condition_E0(u, t, integrator)
		u[1] ≥ 4.5
	end

	function affect_E0!(integrator)
		integrator.p[1] = integrator.p[2]
	end

	cb_E0 = ContinuousCallback(condition_E0, affect_E0!, save_positions=(false, false))

	return CallbackSet(cb_E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
