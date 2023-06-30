function getCallbacks_01780_sbml_l2v5()

	function condition_E0(u, t, integrator)
		t == 0.45
	end

	function affect_E0!(integrator)
		integrator.p[1] = 0.2
		integrator.u[1] = 0.2
	end

	cb_E0 = DiscreteCallback(condition_E0, affect_E0!, save_positions=(false, false))

	return CallbackSet(cb_E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
