function getCallbacks_01584_sbml_l3v1()

	function condition_E0(u, t, integrator)
		u[2] ≥ 3
	end

	function affect_E0!(integrator)
		integrator.p[2] = integrator.u[2]
	end

	cb_E0 = ContinuousCallback(condition_E0, affect_E0!, save_positions=(false, false))

	return CallbackSet(cb_E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
