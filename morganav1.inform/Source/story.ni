"Morgana" by Brianna

[---------------------Setup--------------------]

The player has a number called energy. The energy of the player is 7. The maximum energy is always 10.

When play begins:
	now the left hand status line is "[location] | Energy: [energy of the player]";
	now the right hand status line is "[time of day]".
	
When play begins (this is the run property checks at the start of play rule):
	repeat with item running through things:
		if description of the item is "":
			say "[item] has no description."

Work duration is a number that varies.

Every turn:
	now work duration is 0;
	increment the turn count;
	follow the time allotment rules;
	if work duration is 0, rule succeeds;
	increase the time of day by (work duration minutes - 1 minute).
	
The time allotment rules are a rulebook.

A time allotment rule for examining or looking:
	now work duration is 0;
	rule succeeds.

A time allotment rule for washing:
	now work duration is -30;
	rule succeeds.

To recharge by (amount - a number):
	if the energy of the player is less than the maximum energy:
		increase the energy of the player by amount;
		say "You feel a bit more energetic."


Examining something is acting fast. Looking is acting fast. [In a game with tight timing, it is sometimes friendliest to the player to let him LOOK and EXAMINE as much as necessary without being penalized.]

A thing can be dirty or clean. 

Washing is an action applying to one visible thing. Understand "wash [something]" as washing. [§12.7. New actions] 
Carry out washing:
	say "The [the noun] are now pretty and clean!".

The description of the player is "You are Morgana, a college student."

[---------------------Gameplay--------------------]

The Dorm Room is a room. The description of the dorm room is "You are sitting in your dorm room on your [bed] in the small apartment you share with 2 other roommates. This room is small and cozy. You see a [desk] in the corner of the room. On the desk is a [laptop]."

The laptop is an openable container in the Dorm Room. 
The laptop is closed. 
[The laptop can be switched on.]
After opening the laptop: say "On the screen is a half-finished programming [assignment]. You've spent about 20 minutes working on it so far."
The assignment is in the laptop. The description of the assignment is "The c++ programming assignment is about half done."

The desk is in the dorm room. The description of the desk is "The wooden desk came with the room. On it is a [laptop]."
The bed is in the dorm room. The description of the bed is "The twin bed is longer than the ones that you grew up sleeping on, but you were happy to buy new sheets for this next chapter in your life."


The common area is south of the dorm room. "The common area contains a small couch, tv, dining table, and a kitchenette. The kitchenette has just a [sink] and a fridge."

The trash can is a thing in the common area. It is a container. "The trash can is barely full."
Instead of removing something from the trash can: say "Ew, it's all dirty now, no thanks."



There is a sink in the common area. The sink contains things called dishes. The dishes can be washed.

Instead of washing the dishes:
	recharge by -4;
	rule succeeds. 

A cup of coffee is in the common area. 

Instead of drinking the cup of coffee:
	move the cup of coffee to the player;
	now the player is carrying the cup of coffee;
	recharge by 2; 
	say "You drink the dark, bitter coffee."
