function getCallbacks_01261_sbml_l3v2()

	function condition__E0(u, t, integrator)
		rateOf(u[1]) ≥ 0.0105
	end

	function affect__E0!(integrator)
		integrator.p[1] = 5
	end

	cb__E0 = ContinuousCallback(condition__E0, affect__E0!, save_positions=(false, false))

	return CallbackSet(cb__E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
