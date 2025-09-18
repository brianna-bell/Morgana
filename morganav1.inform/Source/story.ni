"Morgana" by Brianna

[---------------------Setup--------------------]

Use serial comma. 

The player has a number called energy. The energy of the player is 100. 
The maximum energy is always 100. The minimum energy is always 0.

The player has a number called progress. The progress of the player is 0. 
The maximum progress is always 100.

The player has a number called drugs taken. The drugs taken of the player is 0. 
The maximum drugs taken is always 5. 

[The effort of washing is always 30. [percent]]
The time to wash is always 1. [hours]

[debug only to skip to Saturday]
Understand "dskip" as casting dskip.
Casting dskip is an action applying to nothing. 
Check casting dskip:
	now the current weekday is Saturday;

A weekday is a kind of value. The weekdays are Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday. The current weekday is a weekday that varies. The current weekday is Wednesday.

Include Basic Screen Effects by Emily Short.

Table of Fancy Status
left	central	right
" [location]"	"[time of day]"	"[current weekday]"
" Energy: [energy of the player]%"	 ""	"Progress: [progress of the player]%"

Rule for constructing the status line:
	 fill status bar with Table of Fancy Status;
	 rule succeeds.

When play begins (this is the run property checks at the start of play rule):
	repeat with item running through things:
		if description of the item is "":
			say "[item] has no description.";
	Say "You are Morgana, a college student struggling to meet your project deadline, keep up with your responsibilities and try to have some kind of social life. Your project deadline is in 3 days (due first thing Saturday morning). Good luck!";

To reverse time by (hours - a number):
	[let target be the time of day minus hours hours;]
	let target be time of day minus hours hours;
	now time of day is target;
	say "The minutes tick backwards.";
	rule succeeds;
	
To forward time by (hours - a number):
	[let target be the time of day minus hours hours;]
	let target be time of day plus hours hours;
	now time of day is target;
	say "The minutes tick forwards.";
	rule succeeds;

To charge by (amount - a number):
	if the amount is positive:
		if the energy of the player is less than the maximum energy:
			increase the energy of the player by amount;
			say "You feel a bit more energetic.";
		increase the drugs taken of the player by 1;
		if the drugs taken of the player is at least the maximum drugs taken: 
			clear the screen;
			end the story saying "Your body couldn't take it. You evaporate into a cloud of red mist. You died, RIP";
			rule fails;
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
		if timer is positive:
			reverse time by timer;
		otherwise:
			forward time by (timer * -1);
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

Washing is an action applying to one visible thing. Understand "wash [something]" as washing. 
Carry out washing:
	say "The [the noun] are now pretty and clean!".

The description of the player is "You are Morgana, a college student. You have 9 fingers and 4 toes."

Understand "xyzzy" or "say xyzzy" or "cast xyzzy" as casting xyzzy.

Casting xyzzy is an action applying to nothing.

Check casting xyzzy:
	say "Nice try bozo.";

Every turn:
	If the time of day is after 11:59 PM:
		say "it's time for bed!";
		Now the energy of the player is the maximum energy;
		Now the drugs taken of the player is 0;
		Now the time of day is 8:59 AM;
		now the current weekday is the weekday after the current weekday;
	If the current weekday is Saturday:
		Say "The time has come to turn in your final project. Your grade is....";
		if the progress of the player is greater than 90:
			say "A! You're on track to become the smartest mind of your generation! Feel proud of your accomplishment and enjoy your time off before the next ovester starts.";
		otherwise if the progress of the player is greater than 80:
			say "B. B's get degrees I guess.";
		otherwise if the progress of the player is greater than 70:
			say "C... Not too great. Better study harder next time.";
		otherwise: 
			say "F for the failure you are :(";
		end the story;


[---------------------Gameplay--------------------]

[---------------------Dorm Room--------------------]

The Dorm Room is a room. The description of the dorm room is "You are sitting in your dorm room on your [bed] in the small apartment you share with 2 other roommates. This room is small and cozy. You see a [desk] in the corner of the room. On the desk is a [laptop]."

The laptop is a device in the Dorm Room. The description of the laptop is "Your small silver laptop." The laptop is switched off.

Understand "work on laptop" or "use laptop" or "type on laptop" or "work on project" as working.

Working is an action applying to nothing. 

Check working when the laptop is switched off:
	say "You should probably turn the laptop on first." instead.

Check working: 
	if progress is maximum progress:
		say "You're completely finished! Time to relax." instead;
	otherwise if the energy of the player is less than 1:
		say "oops too tired :(" instead;

Carry out working:
	move the laptop to the player;
	let effort be a random number from 10 to 25;
	increase progress of the player by effort;
	if progress of the player > maximum progress:
		now progress of the player is maximum progress;
	let worktime be a random number from 1 to 3;
	drain by (worktime * 10) and (worktime * -1);

Report working:
	if progress of the player is 0:
		say "You get started on your project. Better late than never.";
	else if progress of the player is less than 30:
		say "You spend some time working on the project. You're making progress.";
	else if progress of the player is less than 60:
		say "You're almost halfway there. You definitely have momentum now.";
	else if progress of the player is less than maximum progress:
		say "You're in the final stretch, just a little more to go!";
	else:
		Say "You are finally done. You can relax, celebrate, or party til Saturday. Enjoy your time.";

Instead of switching on the laptop:
	if the laptop is switched off:
		now the laptop is switched on;
		say "You turn on the laptop and find your project right where you left it. It's [progress of the player] percent done.";
	else:
		say "It's already on.";


The desk is in the dorm room. The description of the desk is "The wooden desk came with the room. On it is a [laptop]."
The bed is in the dorm room.  The description of the bed is "The twin bed is longer than the ones that you grew up sleeping on, but you were happy to buy new sheets for this next chapter in your life."
After examining the bed:
	Say "Underneath it is a lockbox.";
	move the lockbox to the Dorm Room.


There is a lockbox. The lockbox is a locked and closed openable container. [This places it "off-stage" until we move it somewhere else.] The description of the lockbox is "A small locked box that you forgot about, and forgot where you put the key." 
The badderall is in the lockbox. The badderall is edible. The description of the badderall is "A sketchy drug that you got at a fuel station last week. The packaging says that it gives you plenty of energy with no side effects." 
After eating the badderall:
	increase the drugs taken of the player by 1;	
	Now the energy of the player is 100;
	remove the badderall from play;
	Say "You feel completely restored!". 


Instead of looking under the bed when the lockbox is off-stage:
	say "There is a forgotten lockbox under your bed.";
	move the lockbox to the Dorm Room.

[The lockbox is a locked and closed openable container in the dorm room.]

The matching key of the lockbox is a square key. 

Before someone opening a locked thing (called the lockbox):
	if the person asked is carrying the matching key of the lockbox, try the person asked unlocking the lockbox with the matching key of the lockbox;
	if the lockbox is locked, stop the action.

[---------------------Hallway------------------------]
The Hallway is south of the dorm room. "A narrow hallway with a mirror, a coatrack, and several posters."

[---------------------Bathroom------------------------]
The Bathroom is south of the Hallway. "A tiny bathroom with a toilet, shower, and sink."

[---------------------Closet------------------------]
The Closet is west of the Hallway. "A small closet with all three of our extra stuff in it."

[Understand "open box" as opening the large box.]
The large box is a closed openable container in the closet. The description of the large box is "A large box containing everything you brought to college but haven't used yet." 
The old bracelet is in the large box.  The description of the old bracelet is "A campy little bracelet that you bought at a thrift store in your hometown several years ago."
The club flyer is in the large box. The description of the club flyer is "A flyer for the Thru club, which some of your friends are a part of. It's really not your cup of tea."
The ratty purse is a container in the large box. The description of the ratty purse is "An old pleather bag that carried you for the last 3 years. You retired it several months ago but kept it because it still holds sentimental value." 
The expired makeup is in the large box. The description of the expired makeup is "You never were one to wear much makeup, but it's too expensive to throw away without feeling bad about it."
The square key is in the ratty purse. The description of the square key is "You completely forgot where you put this key!".
After examining the square key:
	If the lockbox is in the dorm room:
		Say "Now you can open the lockbox under your bed.";
	Otherwise:
		Say "If only you remembered what it went to.". 


[---------------------Common Area------------------------]
The Common Area is east of the hallway. "The common area contains a small couch, tv, dining table, and a kitchenette. The kitchenette has just a sink and a fridge. There is also a small [trash can]. There's also a coffee maker on the counter. [if the pile of dishes are dirty]All of the coffee cups are dirty though.[otherwise]The coffee cups are clean and ready to use.[end if] There's also a [pile of dishes][if the pile of dishes are dirty] soaking in the sink. [otherwise] clean and drying on the counter.[end if]";

The trash can is a container in the common area. The description of the trash can is "The trash can is barely full."
Instead of removing something from the trash can: say "Ew, it's all dirty now, no thanks."

Instead of examining the trash can:
	clear only the main screen;
	display the boxed quotation "That's where you belong".

The pile of dishes are things in the common area. The pile of dishes can be washed. The pile of dishes are dirty. 

The description of the pile of dishes is "A few coffee cups, cereal bowls, and spoons. [if the pile of dishes are dirty]They are covered in greasy stains and leftover food and have been here for a few days.[otherwise] They are clean and drying on the countertop.[end if]".

Instead of washing the dishes:
	if the dishes are dirty:
		let effort of washing be a random number from 25 to 35;
		Drain by the effort of washing and 2;
		Now the dishes are clean;
	otherwise:
		say "but they're already clean.";

A cup of coffee is a thing. The description of the cup of coffee is "A warm cup of fresh hot coffee. The outside reads '#1 Mug'".

Brewing coffee is an action applying to nothing. Understand "brew coffee" as brewing coffee.
Carry out brewing coffee:
	if the dishes are clean:
		now there is a cup of coffee;
		move the cup of coffee to the player;
		say "You have a fresh cup of coffee.";
	otherwise:
		say "All the mugs are dirty.";

Instead of drinking the cup of coffee:
	now the player is carrying the cup of coffee;
	say "You drink the hot coffee and it warms you from the inside.";
	charge by 2; 
	remove the cup of coffee from play;

[---------------------Far Hall------------------------]
The Far Hall is east of the common area. The description of the Far Hall is "A hall similar to the one outside of your door. Your two roommates have set out their jackets and shoes set out."

[---------------------Katie's Room------------------------]
The Katie's Room is north of the far hall. The description of Katie's Room is "Her room is decorated with nerdy stuff. She's an architectural student and loves math. The same type of desk as yours. She has a laptop charger and a mousepad with equations on it. On one of the walls is a tourism poster of earth. You both hope to go there one day."
[Add her homework here in the afternoons]

[---------------------Jessie's Room------------------------]
Jessie's Room is east of the far hall. The description of Jessie's Room is "Her room is set up sophisticated. She has a full set of school supplies all in creme and pastel coordinating hues. Her bed is always made and her books are always on the shelf. She has a picture on her desk of her and her younger brother. She misses him often."

[---------------------Long Hall------------------------]
The Long Hall is south of the Common Area. The description of the Long Hall is "A longer corridor that leads to a study hall to the east, Annie's Room to the south, and the courtyard outside to the west. On the door to your dorm there are 3 different critters with each of your names on them."

[---------------------Study Room------------------------]
The Study Room is east of the long hall. 
[boost progress?] 

[---------------------Annie's Room------------------------]
Annie's Room is south of the long hall. 

[---------------------Courtyard------------------------]
The Courtyard is west of the long hall.

[---------------------Train Station------------------------]
The Train Station is south of the courtyard.
[to party house or grocery store or both?]

[---------------------Sidewalk------------------------]
The Sidewalk is west of the courtyard.

[---------------------Professor's Office------------------------]
The Professor's Office is west of the sidewalk. 

[---------------------Gym------------------------]
The Gym is north of the courtyard.


