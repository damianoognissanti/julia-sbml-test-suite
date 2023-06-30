function getCallbacks_01446_sbml_l3v1()

	function condition__E0(u, t, integrator)
		t == 5
	end

	function affect__E0!(integrator)
		A1_sr = 1
		A1_sr2 = 3
	end

	cb__E0 = DiscreteCallback(condition__E0, affect__E0!, save_positions=(false, false))

	return CallbackSet(cb__E0), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
