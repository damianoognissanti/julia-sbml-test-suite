function getCallbacks_01227_sbml_l2v5()

	function condition__E0(u, t, integrator)
		t == J0
	end

	function affect__E0!(integrator)
		integrator.p[2] = 2
	end

	cb__E0 = DiscreteCallback(condition__E0, affect__E0!, save_positions=(false, false))

	return CallbackSet(cb__E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
