(*

category:      Test
synopsis:      Rate rule used to determine parameter value which is used 
               in a reaction.
componentTags: Compartment, Species, Reaction, Parameter, RateRule 
testTags:      InitialAmount, NonConstantParameter
testType:      TimeCourse
levels:        1.2, 2.1, 2.2, 2.3

The model contains one compartment named compartment.
  There are three species named S1, S2 and S3 and two parameters named k1 and k2.
  The model contains two reactions defined as:

[{width:30em,left-margin:5em}| | *Reaction* | *Rate* |
| S1+S2 -> S3 | $k1*S1*S2*compartment$  |
| S3 -> S1+S2 | $k2*S3*compartment$  |]

  The model contains one rule which defines that rate at which parameter k1 
  varies:

[{width:30em,left-margin:5em}| *Type* | *Variable* | *Formula* |
 | Rate | k1 | $0.2$  |]


The initial conditions are as follows:

[{width:30em,left-margin:5em}| | *Value* | *Units* |
|              Initial amount of S1:| $          1.0$ | mole                      |
|              Initial amount of S2:| $          2.0$ | mole                      |
|              Initial amount of S3:| $          1.0$ | mole                      |
|             Value of parameter k1:| $          1.7$ | litre mole^-1^ second^-1^ |
|             Value of parameter k2:| $          0.3$ | second^-1^ |
| Volume of compartment compartment:| $            1$ | litre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) they must be treated as concentrations where they appear in
expressions.

*)

newcase[ "00067" ];

addCompartment[ compartment, size -> 1 ];
addSpecies[ S1, initialAmount -> 1.0 ];
addSpecies[ S2, initialAmount -> 2.0 ];
addSpecies[ S3, initialAmount -> 1.0 ];
addParameter[ k1, value -> 1.7 , constant->False];
addParameter[ k2, value -> 0.3 ];
addRule[ type->RateRule, variable -> k1, math -> 0.2];
addReaction[ S1+S2 -> S3, reversible -> False,
	     kineticLaw -> k1*S1*S2*compartment ];
addReaction[ S3 -> S1+S2, reversible -> False,
	     kineticLaw -> k2*S3*compartment ];

makemodel[]
