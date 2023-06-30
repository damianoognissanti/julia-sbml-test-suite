function getCallbacks_00945_sbml_l2v4()

	function condition_event1(u, t, integrator)
		u[1] ≥ 2.1
	end

	function affect_event1!(integrator)
		integrator.p[1] = 10
	end

	cb_event1 = ContinuousCallback(condition_event1, affect_event1!, save_positions=(false, false))

	return CallbackSet(cb_event1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
