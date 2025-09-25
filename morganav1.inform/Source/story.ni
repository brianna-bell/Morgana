"Morgana" by Brianna

Release along with the "Parchment" interpreter. Release along with cover art.

[---------------------Setup--------------------]

Use serial comma. 

The player has a number called energy. The energy of the player is 100. 
The maximum energy is always 100. The minimum energy is always 0.

The player has a number called progress. The progress of the player is 0. 
The maximum progress is always 100.

The player has a number called drugs taken. The drugs taken of the player is 0. 
The maximum drugs taken is always 5. 

The player has a number called quality of life. The quality of life of the player is 100.
The minimum quality of life is always 0.

The player has a number called markiplier. The markiplier of the player is 1.

The player has a number called minutes passed. The minutes passed of the player is 0.

Groceries bought is a truth state that varies. Groceries bought is false.

Party thrown is a truth state that varies. Party thrown is false.

[The effort of washing is always 30. [percent]]
The time to wash is always 1. [hours]

Talking to is an action applying to one visible thing.
Understand "talk to [someone]" as talking to.

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
	Say "You are Morgana, a college student struggling to meet your project deadline, keep up with your responsibilities and try to have some kind of social life. Your project is due Friday night at 11:59pm. Good luck! If you need help at any time, just say HELP.";
	

Include Basic Help Menu by Emily Short.

Table of Basic Help Options (continued)
title	subtable	description
"Easter Eggs (After playing the game)"	Table of Eggs	""
"Hints"	Table of Hints	--

Table of Eggs
title	subtable	description	toggle
"Procrastinate"	--	"Every college kid has done it. Try doing 'procrastinate'"	--
"Xyzzy"	--	"A classic IF word. Try doing 'xyzzy'"	--
"Trash"	--	"Try doing 'examine trash can' in the Common Area"	--

Table of Hints
title	subtable	description	toggle
"What do I do with the lockbox?"	--	"Open it with the key."	hint toggle rule
"Where is the key to the lockbox?"	--	"In a place where things are stored."	hint toggle rule
"What is Glorp?"	--	"Glorp is the name of your alien pet cat that you got at a shelter last year. She's so cute and fluffy."	hint toggle rule
"Are there drugs at the party?"	--	"There sure are. Try not to pregame it with coffee."	hint toggle rule
"Why can't I kiss my roommates?"	--	"They're just not into you, sorry."	hint toggle rule



To reverse time by (hours - a number):
	[let target be the time of day minus hours hours;]
	let target be time of day minus hours hours;
	now time of day is target;
	[say "The minutes tick backwards.";]
	rule succeeds;
	
To forward time by (hours - a number):
	[let target be the time of day minus hours hours;]
	let target be time of day plus hours hours;
	now time of day is target;
	[say "The minutes tick forwards.";]
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
	say "The [the noun] are now pretty and clean!";
	Increase the quality of life of the player by 30.

The description of the player is "You are Morgana, a college student. You have 9 fingers and 4 toes."

Understand "xyzzy" or "say xyzzy" or "cast xyzzy" as casting xyzzy.

Casting xyzzy is an action applying to nothing.

Check casting xyzzy:
	say "Nice try bozo.";


Understand "procrastinate" or "waste time" or "stall" as casting procrastinate.

Casting procrastinate is an action applying to nothing.

Check casting procrastinate:
	Let the duration be a random number from 3 to 5;
	forward time by the duration;
	Say "A while passes...".

The current hour is a number that varies.

Every turn:
	let H be the hours part of the time of day;
	if H is not the current hour: [only decrease the quality of life once an hour]
		now the current hour is H;
		Let the qoldis be a random number from 5 to 15;
		Decrease the quality of life of the player by qoldis;
	If the quality of life of the player is negative:
		Say "You neglected your own needs too much and need to be hospitalized. You missed your project deadline and also have a hefty medical bill to deal with.";
		end the story;
	Otherwise if the quality of life of the player is less than 20:
		Say "You've been working too hard. You might want to take care of yourself.";
	If the time of day is after 11:59 PM:
		say "It's time for bed! You wake up the next day fully rested.";
		Now the player is in the dorm room;
		Now the energy of the player is the maximum energy;
		Now the drugs taken of the player is 0;
		Now the time of day is 8:59 AM;
		now the current weekday is the weekday after the current weekday;
		Now the teeth are dirty;
		Now the body is dirty;
		Now the dishes are dirty; [____________________make sure to reset everything______________________]
	If the current weekday is Friday:
		If the time of day is 11:59 PM:
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
	Otherwise if the current weekday is Saturday: 
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

The Dorm Room is a room. The description of the dorm room is "You are sitting in your dorm room on your [bed] in the small apartment you share with 2 other roommates. This room is small and cozy. You see a [desk] in the corner of the room. On the desk is a [laptop]. There is also an [easel] with a blank canvas on it. The door leading out to the hall is to the south."

The easel is in the dorm room. The description of the easel is "A simple wooden easel with a blank canvas on it. You like to paint in your free time or when just avoiding your responsibilities.".
Painting is an action applying to one visible thing. Understand "make painting" and "paint" and "paint canvas" as painting.
Carry out painting:
	If the player is in the dorm room:
		let result be a random number from 1 to 3;
		if result is 1:
			say "You pick up a paint brush and let your heart take control. You get so focused on painting that you lose track of time. But at the end, you have a completed painting of the campus at dusk, with the sun setting and the two moons already high in the sky.";
		if result is 2:
			say "You pick up a paint brush and let your heart take control. You get so focused on painting that you lose track of time. But at the end, you have a completed painting of little Glorp curled up in a flower pot as a baby.";
		if result is 3:
			say "You pick up a paint brush and let your heart take control. You get so focused on painting that you lose track of time. But at the end, you have a completed painting of abstract colors and shapes. Not your best work but it got it out of your system.";
		Forward time by 4;
		If the energy of the player is less than 85:
			Increase the energy of the player by 15;
		Otherwise:
			Now the energy of the player is 100;
	Otherwise:
		Say "There's nothing here to paint."

The laptop is a device in the Dorm Room. The description of the laptop is "Your small silver laptop." The laptop is switched off.

Understand "work on laptop" or "use laptop" or "type on laptop" or "work on project" as working.

Working is an action applying to nothing. 

Check working when the laptop is switched off:
	Now the laptop is switched on;

Check working: 
	if progress is maximum progress:
		say "You're completely finished! Time to relax." instead;
	otherwise if the energy of the player is less than 1:
		say "You're too tired to continue, better step away and do something else for a bit." instead;

Carry out working:
	move the laptop to the player;
	let effort be a random number from 5 to 15;
	let effort be effort * markiplier of the player;
	let worktime be a random number from 1 to 3;
	let difference be the energy of the player - (worktime * 10);
	if the difference greater than -1:
		drain by (worktime * 10) and (worktime * -1);
		increase progress of the player by effort;
		if progress of the player > maximum progress:
			now progress of the player is maximum progress;

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
		Say "You are finally done. You can relax, take care of yourself, or party til Saturday. Enjoy your time."

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
	Now the quality of life of the player is 150;
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
The Hallway is south of the dorm room. The description of the hallway is "A narrow hallway with a few posters, a mirror, and a shoe rack. To the north is your dorm room. To the south is a small bathroom that is all yours. There is a tiny closet to the west. The common area is to the east."

[---------------------Bathroom------------------------]
The Bathroom is south of the Hallway. The description of the bathroom is "A tiny bathroom with a toilet, shower, and sink. Next to the sink there are your toothbrush and toothpaste. Your shower has only your soap and shampoo in it. You're glad that you don't have to share a bathroom with anyone else. The door back to the hallway is to the north."

There is a body. The body can be showered. The body is dirty. [reset]
The description of the body is "You have 2 arms and 3 legs.[if body is dirty] You haven't showered in a while and are kind of grody.[otherwise] You are still nice and clean.[end if]".
Understand "take a shower" and "shower" as showering.
Showering is an action applying to nothing. 
Check showering:
	if the player is in the bathroom: 
		if the body is dirty:
			Reverse time by 1;
			Say "You turn on the shower and wait for the water to heat up. When it's hot, you strip and step inside. The steam fogs up the bathroom but it feels so nice on your skin. You take your time shampooing and scrubbing your body. You feel much better after showering.";
			Increase the quality of life of the player by 30;
			If the energy of the player is less than 85:
				Increase the energy of the player by 15;
			Otherwise:
				Now the energy of the player is 100;
			Now the body is clean;
		otherwise:
			Say "But you're already clean.";
	otherwise:
		Say "There's no shower here.";

There is a teeth. The teeth can be brushed. The teeth is dirty. The description of the teeth is "Chompers.". [reset]

Understand "brush teeth" as brushing.
Brushing is an action applying to nothing.
Check brushing:
	If the player is in the bathroom:
		If the teeth is dirty: 
			Reverse time by 1;
			Say "You pick up your toothbrush, add some toothpaste, and brush your teeth. Afterwards, you feel fresh."; 
			Increase the quality of life of the player by 10;
			If the energy of the player is less than 90:
				Increase the energy of the player by 10;
			Otherwise:
				Now the energy of the player is 100;
			Now teeth are clean;
		Otherwise:
			Say "But your teeth are already clean.";
	Otherwise:
		Say "There's no toothbrush here.";

[---------------------Closet------------------------]
The Closet is west of the Hallway. The description of the closet is "A small closet with all of my extra stuff in it. There's barely room to step inside."

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
The Common Area is east of the hallway. "The common area contains a small couch, tv, dining table, and a kitchenette with a [fridge] and a coffee maker. There is also a small [trash can]. [if the pile of dishes are dirty]All of the coffee cups are dirty though.[otherwise]The coffee cups are clean and ready to use.[end if] There's also a [pile of dishes][if the pile of dishes are dirty] soaking in the sink. [otherwise] clean and drying on the counter.[end if] There is a [game] console hooked up to the TV. Resting on the sofa is your fuzzy [pet alien], Glorp. To the east is your roommates side of the apartment. To the south is the front door.";

The pet alien is an animal in the common area. 
Understand "Glorp" and "glorp" and "pet" and "alien" as pet alien.
The description of the pet alien is "The cute fuzzy little green alien is your precious pet that you've had for a year. You love her to bits.".

Petting is an action applying to one visible thing. 
Understand "Pet [something]" as petting.
Carry out petting:
	If the player is in the common area:
		If the noun is the pet alien:
			Say "You pet little Glorp and he meows lovingly at you. Your soul feels a little bit better.";
			Forward time by 1;
			Increase the quality of life of the player by 20;
			If the energy of the player is less than 90:
				Increase the energy of the player by 10;
			Otherwise:
				Now the energy of the player is 100;
		Otherwise:
			Say "You pat it a few times, but it's not very fun.";
	Otherwise:
		Say "There's nothing fluffy to pet in here.".


Feeding is an action applying to one visible thing.
Understand "feed [something]" as feeding.

Check feeding:
	If the player is in the common area:
		if the noun is pet alien:
			Say "You pour food into her bowl and she crunches it all up, then goes back to lay down on the couch.";
			Increase the quality of life of the player by 20;
			Reverse time by 1;
			Decrease energy of the player by 5;
		Otherwise:
			Say "That doesn't need to be fed.";
	Otherwise:
		Say "There's nothing to feed here.".




The game is a device in the common area. The description of the game is "This is your gamesphere that you brought from home. You love to sit and play it for hours. It's calling your name." 
Understand "gamesphere" and "console" as game.
Instead of switching on the game:
	if the game is switched off:
		now the game is switched on;
		say "You boot up the gamesphere and see your favorite game pop up.";
	else:
		say "It's already on.";
		
Playing is an action applying to one visible thing. Understand "play [something]" as playing. 
Carry out playing:
	Forward time by 4;
	say "You get lost playing the [the noun] and zone back into reality several hours later.";
	Increase the quality of life of the player by 50;
	If the energy of the player is greater than 80:
		Now the energy of the player is 100;
	Otherwise:
		Increase the energy of the player by 20;


The fridge is a container in the common area. The description of the fridge is "A small fridge that [if groceries bought is true]has the groceries you bought earlier. You can make a meal for yourself or bake some cookies.[otherwise]is pretty much empty except for some of your roomates leftovers.[end if]".

Food is a thing. The description of food is "Groceries that you bought at the store. There's enough to cook a few meals and make some cookies too.".

Instead of searching the fridge:
	if groceries bought is true:
		now the food is in the fridge;
		say "You see some food inside the fridge.";
	otherwise:
		Say "All there is are your roommates old leftovers. You're not sure how long they've been in there."
		

Cooking is an action applying to nothing. Understand "cook food" and "make meal" as cooking. 
Carry out cooking:
	If the player is in the common area:
		If groceries bought is true:
			If the dishes are clean:
				Say "Let em cook! You cook and eat a nice little meal.";
				Reverse time by 2;
				Increase the quality of life of the player by 40;
				Decrease the energy of the player by 20;
			Otherwise:
				Say "The dishes are all dirty though.";
		Otherwise:
			Say "There's no food in the fridge.";
	Otherwise: 
		Say "There's no food here.".

Baking is an action applying to nothing. Understand "bake" and "bake sweets" and "bake cookies" as baking.
Carry out baking:
	If the player is in the common area:
		If groceries bought is true:
			If the dishes are clean:
				Say "You have enough to bake a dozen cookies. You get in the baking zone and end up with fresh cookies. You eat a few and they taste so good.";
				Forward time by 3;
				Increase the quality of life of the player by 20;
				If the energy of the player is greater than 80:
					Now the energy of the player is 100;
				Otherwise:
					Increase the energy of the player by 20;
			Otherwise:
				Say "The dishes are all dirty though.";
		Otherwise:
			Say "There's no food in the fridge.";
	Otherwise: 
		Say "There's no food here.".

The trash can is a container in the common area. The description of the trash can is "The trash can is barely full."
Instead of removing something from the trash can: say "Ew, it's all dirty now, no thanks."

Instead of examining the trash can:
	clear only the main screen;
	display the boxed quotation "That's where you belong.".

The pile of dishes are things in the common area. The pile of dishes can be washed. The pile of dishes are dirty. 

The description of the pile of dishes is "A few coffee cups, cereal bowls, and spoons. [if the pile of dishes are dirty]They are covered in greasy stains and leftover food and have been here for a few days.[otherwise] They are clean and drying on the countertop.[end if]".

Instead of washing the dishes:
	if the dishes are dirty:
		let effort of washing be a random number from 25 to 35;
		Drain by the effort of washing and 2;
		Now the dishes are clean;
		Increase the quality of life of the player by 30;
		Say "The dishes are all clean and ready to use.";
	otherwise:
		say "But they're already clean.";

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
	Increase the quality of life of the player by 10;
	remove the cup of coffee from play;

[---------------------Far Hall------------------------]
The Far Hall is east of the common area. The description of the Far Hall is "A hall similar to the one outside of your door. Your two roommates have set out their jackets and shoes set out. Katie's Room is to the north and Jessie's Room is to the east."


[---------------------Katie's Room------------------------]
The Katie's Room is north of the far hall. The description of Katie's Room is "Her room is decorated with nerdy stuff. She's an architectural student and loves math. The same type of desk as yours. She has a laptop charger and a mousepad with equations on it. On one of the walls is a tourism poster of earth. You both hope to go there one day."
[Add her homework here in the afternoons]

[---------------------Jessie's Room------------------------]
Jessie's Room is east of the far hall. The description of Jessie's Room is "Her room is set up sophisticated. She has a full set of school supplies all in creme and pastel coordinating hues. Her bed is always made and her books are always on the shelf. She has a picture on her desk of her and her younger brother. She misses him often."

[---------------------Long Hall------------------------]
The Long Hall is south of the Common Area. The description of the Long Hall is "A longer corridor that leads to a study room to the east, Annie's Room to the south, and the courtyard outside to the west. On the door to your dorm there are 3 different critters with each of your names on them."

[---------------------Study Room------------------------]
The Study Room is east of the long hall. The description of the Study Room is "A room smaller than the common area. It has a few tables, chairs, and a whiteboard on the wall. When you walk in, [Katie] and [Jessie] look up from their computers and wave at you. The vibes are good, so you can all work on your projects here together.". 
Katie is a woman in the study room. The description of Katie is "She has shouler length blonde hair that's always tied up. Her laptop has nery stickers all over it. She is a good friend of yours.".
Jessie is a woman in the study room. The description of Jessie is "She has long brown hair that is usually curled and styled, but it's finals week so it's up in a high bun. She still looks as pretty as always.".

After going to the study room:
	Now the markiplier of the player is 2;
	Continue the action.

After going from the study room:
	Now the markiplier of the player is 1;
	Continue the action.



[---------------------Annie's Room------------------------]
Annie's Room is south of the long hall. The description of Annie's Room is "A similar common area to yours, but mirrored. Annie lives here. You two are good friends with some romantic tension, so the two of you hang out here often. She lucked into a single room so this is all hers."
Annie is a woman in Annie's Room. The description of Annie is "She's the most stunning person you've ever seen. You've had a crush on her for several months and talk every day."

Annie has a number called affection. The affection of Annie is 0.

Flirting with is an action applying to one visible thing.
Understand "flirt with [someone]" as flirting with.

Check flirting with:
	if the noun is not Annie:
		say "You don't have a crush on [the noun]." instead;
	if the player is not in the location of the noun:
		say "You can imagine how it would go, but can't do it since [the noun] isn't here." instead.

Carry out flirting with Annie:
	if the affection of Annie is 0:
		say "You hold her hand and tell her how amazing she is. She blushes and smiles.";
		increase the affection of Annie by 1;
	otherwise if the affection of Annie is 1:
		Say "You admit your feelings to her and she says that she has a crush on you too. You both giggle nervously.";
		increase the affection of Annie by 1;
	otherwise:
		Say "You kiss her hand and she melts at your touch.".


Instead of kissing Annie:
	if the affection of Annie is less than 2:
		say "Annie turns her head away. Maybe try flirting with her a little more." instead;
	otherwise if the affection of Annie is greater than 4:
		Clear the screen;
		Say "You get lost in her kisses, and time flies by. There is nothing else in the world but the two of you. You forget to turn in the project and have to retake the class, but you have the girlfriend of your dreams so it's worth it.";
		end the story saying "Romance Ending";
	otherwise if the affection of Annie is 2:
		say "You kiss Annie, and she kisses you back gently. The kiss is everything you ever dreamed of and more.";
		increase the affection of annie by 1;
	otherwise:
		Say "You kiss her again and you fall further in love with her.";
		Increase the affection of annie by 1;

Carry out talking to Annie:
	If the player is in Annie's Room:
		say "You strike up a conversation with Annie about the latest memes and campus shenanigans. Talking and laughing with her takes some stress out of your mind. She always knows how to lighten your mood. You do get a little lost in the conversation.";
		Forward time by 5;
		Increase the quality of life of the player by 40;
		If the energy of the player is greater than 80:
			Now the energy of the player is 100;
		otherwise:
			Increase the energy of the player by 20;
	otherwise:
		Say "She's not here.".



[---------------------Courtyard------------------------]
The Courtyard is west of the long hall. The description of the Courtyard is "The courtyard is a big area inside of a dome to keep the atmosphere in. The dome is clear so you can see outside to the rest of campus. You see a path to the north that leads to the gym, a path to the train station to the south, and the rest of campus to the west."

[---------------------Train Station------------------------]
The Train Station is south of the courtyard. The description of the Train Station is "The train that leads off campus is here. You can take it eastward to go get groceries or westward to go to the sorority house.".


[---------------------Grocery Store------------------------]
The Grocery Store is east of the Train Station. The description of the Grocery Store is "The local grocer carries cheap and easy meals. You fill your basket, check out, and are ready to go back home. Take the train west to go back to campus.".
After going to the Grocery Store:
	Forward time by 1;
	Increase quality of life of the player by 40;
	Decrease the energy of the player by 20;
	Now the groceries bought is true;
	Continue the action;
	

[Although it's a lot healthier to buy ingredients and cook your meals from scratch.]

[---------------------Sorority House------------------------]
The Sorority House is west of the Train Station. The description of the Sorority House is "A big fancy house with greek letters on the outside.[If party thrown is false] You arrive at the sorority house just in time for the party. Once you go inside, there are about 35 sorority girls all drinking and having fun. You also see your crush Annie. You join the party and have a good time. After a few hours, the party winds down and it's time to go back home. You can take the train eastward to get back to campus.[otherwise] The party already happened. There's nothing else to do here.[end if]".

After going from the Sorority House: [this is a little delayed but it'll do for now]
	If party thrown is false:
		Forward time by 6;
		Increase quality of life of the player by 70;
		Increase the drugs taken of the player by 2;
		Now party thrown is true;
		Continue the action;

[---------------------Sidewalk------------------------]
The Sidewalk is west of the courtyard. The description of the Sidewalk is "A long stretch from the courtyard to the building where your professor's office is. The walk is nice and peaceful. The professor's office is to the west and the courtyard is to the east."

[---------------------Professor's Office------------------------]
The Professor's Office is west of the sidewalk. The description of the Professor's Office is "You walk into your professor's office. She is there, grading homework assignments. She welcomes you in. You ask her some questions about the final project, and feel that you understand what to do better. The sidewalk is to the east which leads back to the courtyard."
After going to the Professor's Office:
	Now the markiplier of the player is 2;
	Reverse time by 2;
	Decrease the energy of the player by 15;
	Continue the action.

[---------------------Gym------------------------]
The Gym is north of the courtyard. The description of the gym is "A modest sized gym that is free for students. The exit back to the courtyard is to the south.".
The treadmill is in the gym. The description of the treadmill is "The older machine is perfect for practicing a pretend runway walk."
The dance loop is in the gym. The description of the dance loop is "A giant person sized loop that lets you hold on tight and spin til your heart is content."
The stationary bike is in the gym. The description of the stationary bike is "A bicycle fixed in place with added resistance to make your muscles stronger."
The weight machine is in the gym. The description of the weight machine is "A machine used for pulling or pushing an amount of weights. It's not your favorite way to exercise." 
Exercising is an action applying to one visible thing. Understand "Exercise on [something]" and "Exercize on [something]" and "work out" and "exercize" as exercising. 
Carry out exercising:
	If the player is in the gym:
		say "You push yourself until you're sweaty and tired, but at least you feel better now";
		Increase the quality of life of the player by 30;
		Forward time by 2;
		Drain by 25 and 0;
	otherwise:
		say "There's no equipment here!";
