function getCallbacks_00934_sbml_l3v2()

	function condition_B(u, t, integrator)
		t == 0.99
	end

	function affect_B!(integrator)
		integrator.u[1] = 2
		integrator.u[2] = 1
	end

	cb_B = DiscreteCallback(condition_B, affect_B!, save_positions=(false, false))


	function condition_A(u, t, integrator)
		t == 0.99
	end

	function affect_A!(integrator)
		integrator.u[1] = 1
		integrator.u[2] = 0
	end

	cb_A = DiscreteCallback(condition_A, affect_A!, save_positions=(false, false))


	function condition_C1(u, t, integrator)
		t == 0.99
	end

	function affect_C1!(integrator)
		integrator.u[1] = 3
		integrator.u[2] = 2
	end

	cb_C1 = DiscreteCallback(condition_C1, affect_C1!, save_positions=(false, false))

	return CallbackSet(cb_B, cb_A, cb_C1), Function[], false
end


function computeTstops(u::AbstractVector, p::AbstractVector)
	return Float64[] 
end 
