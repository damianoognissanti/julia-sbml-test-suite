function getCallbacks_00987_sbml_l2v2()

	function condition__E0(u, t, integrator)
		t == 0.99
	end

	function affect__E0!(integrator)
		integrator.p[2] = 1
	end

	cb__E0 = DiscreteCallback(condition__E0, affect__E0!, save_positions=(false, false))

	return CallbackSet(cb__E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
