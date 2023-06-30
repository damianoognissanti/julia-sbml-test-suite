function getCallbacks_01715_sbml_l2v4()

	function condition_E1(u, t, integrator)
		u[2] ≥ 2.3
	end

	function affect_E1!(integrator)
		integrator.u[2] = integrator.u[1]+integrator.u[2]
	end

	cb_E1 = ContinuousCallback(condition_E1, affect_E1!, save_positions=(false, false))

	return CallbackSet(cb_E1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
