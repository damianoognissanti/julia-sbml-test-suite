(*

category:      Test
synopsis:      Basic two reactions with five species in a 1 dimensional compartment 
               where one species is constant.
componentTags: Compartment, Species, Reaction, Parameter 
testTags:      InitialAmount, ConstantSpecies, 1D-Compartment
testtype:      TimeCourse
levels:        2.1, 2.2, 2.3

The model contains one compartment named compartment.
  There are five species named S1, S2, S3, S4 and S5 and two parameters named k1 and k2.
  Compartment compartment is 1-dimensional.
  Species S5 is labeled as constant and therefore cannot be changed 
  by rules or reactions.
  The model contains two reactions defined as:
[| | Reaction       |||||| Rate |
 | | S1+S2 -> S3+S4 |||||| $k1*S1*S2*compartment$  |
 | | S3+S4 -> S1+S2 |||||| $k2*S3*S4*compartment/S5$  |]


The initial conditions are as follows:
[|                                  ||          Value  || Units                     |
|              Initial amount of S1:|| $ 1.0 \x 10^-6$ || mole                      |
|              Initial amount of S2:|| $ 1.5 \x 10^-6$ || mole                      |
|              Initial amount of S3:|| $ 2.0 \x 10^-6$ || mole                      |
|              Initial amount of S4:|| $ 0.5 \x 10^-6$ || mole                      |
|              Initial amount of S5:|| $ 1.0 \x 10^-6$ || mole                      |
|             Value of parameter k1:|| $  1.3 \x 10^6$ || metre mole^-1^ second^-1^ |
|             Value of parameter k2:|| $          0.3$ || metre mole^-1^ second^-1^ |
| Length of compartment compartment:|| $            1$ || metre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) they must be treated as concentrations where they appear in
expressions.

*)

newcase[ "00256" ];

addCompartment[ compartment, size -> 1, spatialDimensions -> 1 ];
addSpecies[ S1, initialAmount -> 1.0 10^-6];
addSpecies[ S2, initialAmount -> 1.5 10^-6];
addSpecies[ S3, initialAmount -> 2.0 10^-6];
addSpecies[ S4, initialAmount -> 0.5 10^-6];
addSpecies[ S5, initialAmount -> 1.0 10^-6, constant->True];
addParameter[ k1, value -> 1.3 10^6 ];
addParameter[ k2, value -> 0.3 ];
addReaction[ S1+S2 -> S3+S4, reversible -> False,
	     kineticLaw -> k1*S1*S2*compartment ];
addReaction[ S3+S4 -> S1+S2, reversible -> False,
	     kineticLaw -> k2*S3*S4*compartment/S5 ];

makemodel[]
