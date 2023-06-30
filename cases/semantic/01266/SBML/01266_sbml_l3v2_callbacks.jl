function getCallbacks_01266_sbml_l3v2()

	function condition__E0(u, t, integrator)
		t == 5.5
	end

	function affect__E0!(integrator)
		integrator.p[1] = rateOf(integrator.u[1])
	end

	cb__E0 = DiscreteCallback(condition__E0, affect__E0!, save_positions=(false, false))

	return CallbackSet(cb__E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
