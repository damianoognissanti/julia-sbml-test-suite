function getCallbacks_00930_sbml_l3v2()

	function condition__E0(u, t, integrator)
		t == 0.99
	end

	function affect__E0!(integrator)
		integrator.u[1] = 4
		integrator.u[3] = 5
		integrator.u[2] = 6
	end

	cb__E0 = DiscreteCallback(condition__E0, affect__E0!, save_positions=(false, false))


	function condition__E1(u, t, integrator)
		t == 0.99
	end

	function affect__E1!(integrator)
		integrator.u[1] = 1
		integrator.u[3] = 2
		integrator.u[2] = 3
	end

	cb__E1 = DiscreteCallback(condition__E1, affect__E1!, save_positions=(false, false))

	return CallbackSet(cb__E0, cb__E1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
