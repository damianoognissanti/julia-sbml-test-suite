function getCallbacks_00849_sbml_l3v1()

	function condition_event1(u, t, integrator)
		u[2] ≤ 0.5
	end

	function affect_event1!(integrator)
		integrator.u[4] = 1.5
		integrator.u[1] = integrator.u[4]
	end

	cb_event1 = ContinuousCallback(condition_event1, affect_event1!, save_positions=(false, false))

	return CallbackSet(cb_event1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
