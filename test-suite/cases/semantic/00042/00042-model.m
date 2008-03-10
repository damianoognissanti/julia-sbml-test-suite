(*

category:      Test
synopsis:      Basic single forward reaction with two species in a 2-dimensional
               compartment.
componentTags: Compartment, Species, Reaction, Parameter, 
testTags:      InitialAmount, 2D-Compartment
testtype:      TimeCourse
levels:        2.1, 2.2, 2.3

The model contains one compartment named compartment.
  There are two species named S1 and S2 and one parameter named k1.
  Compartment compartment is two-dimensional.
  The model contains one reaction defined as:
[| | Reaction |||||| Rate |
 | | S1 -> S2 |||||| $k1*S1*compartment$  |]

The initial conditions are as follows:
[|                                  ||          Value  || Units                     |
|              Initial amount of S1:|| $1.5 \x 10^-15$ || mole                      |
|              Initial amount of S2:|| $         0 \x$ || mole                      |
|             Value of parameter k1:|| $            1$ || second^-1^                |
|   Area of compartment compartment:|| $1$             || metre^2^                  |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) they must be treated as concentrations where they appear in
expressions.

*)

newcase[ "00042" ];

addCompartment[ compartment, spatialDimensions-> 2, size -> 1 ];
addSpecies[ S1, initialAmount -> 1.5 10^-15 ];
addSpecies[ S2, initialAmount -> 0 ];
addParameter[ k1, value -> 1 ];
addReaction[ S1 -> S2, reversible -> False,
	     kineticLaw -> k1*S1*compartment ];

makemodel[]
