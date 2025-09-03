"Morgana" by Brianna

[---------------------Setup--------------------]

Use serial comma. 

The player has a number called energy. The energy of the player is 7. 
The maximum energy is always 10. The minimum energy is always 0.

The effort of washing is always 4.
The time to wash is always 2.

When play begins:
	now the left hand status line is "[location] | Energy: [energy of the player]";
	now the right hand status line is "[time of day]".
	
When play begins (this is the run property checks at the start of play rule):
	repeat with item running through things:
		if description of the item is "":
			say "[item] has no description."

To reverse time by (hours - a number):
	[let target be the time of day minus hours hours;]
	let target be time of day minus hours hours;
	now time of day is target;
	say "The minutes tick backwards.";
	rule succeeds;

To charge by (amount - a number):
	if the amount is positive:
		if the energy of the player is less than the maximum energy:
			increase the energy of the player by amount;
			say "You feel a bit more energetic.";
	otherwise:
		if the energy of the player is less than the minimum energy:
			Now the energy of the player is the minimum energy;
			say "You don't have the energy to do much else.";
			rule fails;
		otherwise: 
			increase the energy of the player by amount; [increase still like adding a negative]
			if the energy of the player is less than the minimum energy:
				Now the energy of the player is the minimum energy;
				say "You don't have the energy to do that.";
				rule fails;
			otherwise:
				say "You feel a little drained.";
				
To drain by (amount - a number) and (timer - a number):
	let difference be the the energy of the player - amount;
	if the difference is positive:
		decrease the energy of the player by amount;
		say "You feel a little worn.";
		reverse time by timer;
		rule succeeds;
	otherwise if the difference is zero:
		decrease the energy of the player by amount;
		say "That's about all the effort you feel like putting in today.";
		reverse time by timer;
		rule succeeds;
	otherwise:
		Say "You're too tired to do that.";
		rule fails;




Examining something is acting fast. Looking is acting fast. [In a game with tight timing, it is sometimes friendliest to the player to let him LOOK and EXAMINE as much as necessary without being penalized.]

A thing can be dirty or clean. 

Washing is an action applying to one visible thing. Understand "wash [something]" as washing. [§12.7. New actions] 
Carry out washing:
	say "The [the noun] are now pretty and clean!".

The description of the player is "You are Morgana, a college student."

Understand "xyzzy" or "say xyzzy" or "cast xyzzy" as casting xyzzy.

Casting xyzzy is an action applying to nothing.

Check casting xyzzy:
	say "Nice try bozo.";


[---------------------Gameplay--------------------]

[---------------------Dorm Room--------------------]

The Dorm Room is a room. The description of the dorm room is "You are sitting in your dorm room on your [bed] in the small apartment you share with 2 other roommates. This room is small and cozy. You see a [desk] in the corner of the room. On the desk is a [laptop]."

The laptop is an openable container in the Dorm Room. 
The laptop is closed. 
[The laptop can be switched on.]
After opening the laptop: say "On the screen is a half-finished programming [assignment]. You've spent about 20 minutes working on it so far."
The description of the laptop is "An older model that you got from your older sister. It does what you need it to do."
The assignment is in the laptop. The description of the assignment is "The c++ programming assignment is about half done."

The desk is in the dorm room. The description of the desk is "The wooden desk came with the room. On it is a [laptop]."
The bed is in the dorm room. The description of the bed is "The twin bed is longer than the ones that you grew up sleeping on, but you were happy to buy new sheets for this next chapter in your life."

[---------------------Common Area------------------------]

The Common Area is south of the dorm room. "The common area contains a small couch, tv, dining table, and a kitchenette. The kitchenette has just a [sink] and a fridge. There is also a small [trash can]."

The trash can is a container. The description of the trash can is "The trash can is barely full."
Instead of removing something from the trash can: say "Ew, it's all dirty now, no thanks."

There is a sink in the common area. The sink contains things called dishes. The dishes can be washed.
The description of the sink is "A shallow metal sink."

The description of the dishes is "A few plates, cereal bowls, and spoons that have been sitting here for at least 2 days."

Instead of washing the dishes:
	Drain by the effort of washing and 2;

A cup of coffee is in the common area. The description of the cup of coffee is "A fresh, hot cup of full caff coffee. Even just smelling it helps you perk up." 

Instead of drinking the cup of coffee:
	move the cup of coffee to the player;
	now the player is carrying the cup of coffee;
	charge by 2; 
	say "You drink the hot coffee and it warms you from the inside."
