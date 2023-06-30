function getCallbacks_00972_sbml_l3v1()

	function condition__E0(u, t, integrator)
		u[1] ≥ 5
	end

	function affect__E0!(integrator)
		Xref = 3
	end

	cb__E0 = ContinuousCallback(condition__E0, affect__E0!, save_positions=(false, false))

	return CallbackSet(cb__E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
