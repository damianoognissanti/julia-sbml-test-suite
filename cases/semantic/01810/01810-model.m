(*

category:        Test
synopsis:        Test SBML IDs named 'inf'
componentTags:   Parameter
testTags:        
testType:        TimeCourse
levels:          1.2, 2.1, 2.2, 2.3, 2.4, 2.5, 3.1, 3.2
generatedBy:     Analytic
packagesPresent: 

This tests whether parameters named 'inf' are properly handled by the simulator.

The model contains:
* 3 parameters (INF, Inf, inf)
The initial conditions are as follows:

[{width:35em,margin: 1em auto}|       | *Value* | *Constant* |
| Initial value of parameter INF | $10$ | constant |
| Initial value of parameter Inf | $1$ | constant |
| Initial value of parameter inf | $0.1$ | constant |]

Note: The test data for this model was generated from an analytical
solution of the system of equations.

*)
