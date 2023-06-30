function getCallbacks_00885_sbml_l2v5()

	function condition_event1(u, t, integrator)
		u[4] ≥ u[3]
	end

	function affect_event1!(integrator)
		integrator.u[2] = integrator.p[1]*time
		integrator.u[1] = (integrator.p[2]*integrator.u[2])*time
	end

	cb_event1 = ContinuousCallback(condition_event1, affect_event1!, save_positions=(false, false))

	return CallbackSet(cb_event1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
