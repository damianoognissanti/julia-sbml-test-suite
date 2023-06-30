function getCallbacks_00379_sbml_l2v1()

	function condition_event1(u, t, integrator)
		u[1] ≤ 0.75
	end

	function affect_event1!(integrator)
		integrator.u[3] = 1
	end

	cb_event1 = ContinuousCallback(condition_event1, affect_event1!, save_positions=(false, false))


	function condition_event2(u, t, integrator)
		u[2] ≥ 1.4
	end

	function affect_event2!(integrator)
		integrator.u[1] = 1
	end

	cb_event2 = ContinuousCallback(condition_event2, affect_event2!, save_positions=(false, false))

	return CallbackSet(cb_event1, cb_event2), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
