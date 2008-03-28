(*

category:      Test
synopsis:      Basic reaction with two species in one
               compartment using an assignmentRule to assign value to a parameter.
componentTags: Compartment, Species, Reaction, Parameter, AssignmentRule 
testTags:      InitialAmount
testType:      TimeCourse
levels:        1.2, 2.1, 2.2, 2.3

The model contains one compartment named compartment.
  There are two species named S1 and S2 and one parameter named k1.
  The model contains one reaction defined as:

[{width:30em,left-margin:5em}| | *Reaction* | *Rate* |
| S1 -> S2 | $compartment*k1*S1$  |]

  The model contains one rule which assigns value to parameter k1:

[{width:30em,left-margin:5em}| *Type* | *Variable* | *Formula* |
 | Assignment | k1 | $0.75$  |]
In this case there is no initial value declared for parameter k1.  Thus the value must be
calculated using the assignmentRule.


The initial conditions are as follows:

[{width:30em,left-margin:5em}| | *Value* | *Units* |
|              Initial amount of S1:| $          0.1$ | mole                      |
|              Initial amount of S2:| $         0.15$ | mole                      |
|             Value of parameter k1:| $   undeclared$ | second^-1^ |
| Volume of compartment compartment:| $            1$ | litre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) they must be treated as concentrations where they appear in
expressions.

*)

newcase[ "00150" ];

addCompartment[ compartment, size -> 1];
addSpecies[ S1, initialAmount -> .1 ];
addSpecies[ S2, initialAmount -> .15 ];
addParameter[ k1, constant -> False ];
addRule[ type->AssignmentRule, variable -> k1, math -> 0.75];
addReaction[ S1 -> S2, reversible -> False,
	     kineticLaw -> compartment*k1*S1];

makemodel[]
