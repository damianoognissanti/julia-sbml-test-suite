(* 

category:      Test
synopsis:      Basic two reactions with three species in one compartment
               and two events that assign value to a species, subject to a delay.
componentTags: Compartment, Species, Reaction, Parameter, EventWithDelay 
testTags:      Amount, NonUnityCompartment, EventIsPersistent
testType:      TimeCourse
levels:        2.1, 2.2, 2.3, 2.4, 2.5, 3.1
generatedBy:   Numeric

The model contains one compartment called C.  There are three species
called S1, S2 and S3 and two parameters called k1 and k2.  The model
contains two reactions defined as:

[{width:30em,margin: 1em auto}|  *Reaction*  |  *Rate*  |
| S1 + S2 -> S3 | $k1 * S1 * S2 * C$  |
| S3 -> S1 + S2 | $k2 * S3 * C$     |]

The model contains two events that assign values to species S2 and S1:

[{width:30em,margin: 1em auto}| | *Trigger*   | *Delay* | *Assignments* |
 | Event1                      | $S1 < 0.5$ | $0.75$  | $S2 = 1$      |
 | Event2                      | $S3 > 1$  | $1.5$   | $S1 = 1$      |]

The initial conditions are as follows:

[{width:30em,margin: 1em auto}| |*Value* |*Units*  |
|Initial amount of S1          |$1.0$   |mole                      |
|Initial amount of S2          |$2.0$   |mole                      |
|Initial amount of S3          |$1.0$   |mole                      |
|Value of parameter k1         |$0.75$  |litre mole^-1^ second^-1^ |
|Value of parameter k2         |$0.25$  |second^-1^                |
|Volume of compartment C       |$1.43$  |litre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) their symbols represent their values in concentration units
where they appear in expressions.

*)

newcase[ "00427" ];

addCompartment[ C, size -> 1.43 ];
addSpecies[ S1, initialAmount -> 1.0];
addSpecies[ S2, initialAmount -> 2.0];
addSpecies[ S3, initialAmount -> 1.0];
addParameter[ k1, value -> 0.75 ];
addParameter[ k2, value -> 0.25 ];
addReaction[ S1 + S2 -> S3, reversible -> False,
	     kineticLaw -> k1 * S1 * S2 * C ];
addReaction[ S3 -> S1 + S2, reversible -> False,
	     kineticLaw -> k2 * S3 * C ];
addEvent[ trigger -> S1 < 0.5, delay->0.75, eventAssignment -> S2->1 ];
addEvent[ trigger -> S3 > 1, delay->1.5, eventAssignment -> S1->1 ];

makemodel[]
