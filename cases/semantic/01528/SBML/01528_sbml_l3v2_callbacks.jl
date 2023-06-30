function getCallbacks_01528_sbml_l3v2()

	function condition_E0(u, t, integrator)
		t == 1.5
	end

	function affect_E0!(integrator)
		integrator.p[1] = rateOf(integrator.u[1])
	end

	cb_E0 = DiscreteCallback(condition_E0, affect_E0!, save_positions=(false, false))

	return CallbackSet(cb_E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
