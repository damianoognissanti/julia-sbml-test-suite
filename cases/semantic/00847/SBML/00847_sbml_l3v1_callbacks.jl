function getCallbacks_00847_sbml_l3v1()

	function condition_event1(u, t, integrator)
		u[2] ≤ 0.5
	end

	function affect_event1!(integrator)
		integrator.u[4] = 1.5
	end

	cb_event1 = ContinuousCallback(condition_event1, affect_event1!, save_positions=(false, false))


	function condition_event2(u, t, integrator)
		u[3] ≤ 0.75
	end

	function affect_event2!(integrator)
		integrator.u[1] = 0.5
	end

	cb_event2 = ContinuousCallback(condition_event2, affect_event2!, save_positions=(false, false))

	return CallbackSet(cb_event1, cb_event2), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
