function getCallbacks_00666_sbml_l2v4()

	function condition_event1(u, t, integrator)
		u[4] ≥ 0.5
	end

	function affect_event1!(integrator)
		integrator.u[4] = 1
	end

	cb_event1 = ContinuousCallback(condition_event1, affect_event1!, save_positions=(false, false))

	return CallbackSet(cb_event1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
