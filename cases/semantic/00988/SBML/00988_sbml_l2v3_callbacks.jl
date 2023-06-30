function getCallbacks_00988_sbml_l2v3()

	function condition_E0(u, t, integrator)
		u[2] ≥ 0.99
	end

	function affect_E0!(integrator)
		integrator.p[2] = 1
	end

	cb_E0 = ContinuousCallback(condition_E0, affect_E0!, save_positions=(false, false))


	function condition_E1(u, t, integrator)
		u[2] ≥ 0.99
	end

	function affect_E1!(integrator)
		integrator.p[2] = 0
	end

	cb_E1 = ContinuousCallback(condition_E1, affect_E1!, save_positions=(false, false))

	return CallbackSet(cb_E0, cb_E1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
