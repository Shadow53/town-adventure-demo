"The Demo Town" by Michael Bryant

Part 1 - Defining the Rules

Chapter 1 - Basic Rules

Section 1 - Basic Settings

Use serial comma.
Use UNDO prevention. [ Prevent player undoing actions ]
The block giving rule is not listed in the check giving it to rules.

[ The player does not "have" something if they have a container containing it ]
To decide whether (C - container) deep contains (T - thing):
	if C contains T:
		decide yes;
	otherwise:
		repeat with C2 running through things in C:
			if C2 is a container:
				if C2 deep contains T:
					decide yes;
	decide no.

To decide whether the player deep has (T - thing):
	If the player has T:
		decide yes;
	otherwise:
		repeat with C running through the list of things carried by the player:
			if C is a container:
				if C deep contains T:
					decide yes;
	decide no.

Section 2 - Sizes

A size is a kind of value.
The sizes are tiny, small, medium, large, and huge.
A thing has a size.
The size of a container is usually medium.

The size of the player is large.

Before taking something (this is the cannot take large things rule):
	if the size of the noun is large or the size of the noun is huge:
		say "[The noun] is too big to carry.";
		stop the action.

Before putting something on something:
	if the size of the noun is greater than the size of the second noun:
		say "It's too big!";
		stop the action.

Before inserting something into something:
	if the size of the noun is greater than the size of the second noun:
		say "It's too big!";
		stop the action.

Section 3 - Reading

A reading material is a kind of thing.
A reading material has some text called print.
The print of a reading material is usually "".

Understand the command "read" as something new.
Understand "read [something]" as reading.
Reading is an action applying to one thing, requiring light.

Check reading:
	if the print of the noun is "":
		say "Nothing is printed on [the noun].";
		stop the action.

Carry out reading:
	say "[the print of the noun][conditional paragraph break]".

Section 4 - Human Beings

A human being is a kind of person.
A man and a woman are kinds of human being.
The size of a human being is large.

Before taking a human being:
	say "I don't think [the noun] would appreciate that.";
	stop the action.

Section 5 - Inventory Listings

[ This set of property-aggregation rules allows me to change/override how
properties of items are listed. This section reimplements the default
settings ]

The print standard inventory rule is not listed in any rulebook.
[The standard name printing rule is not listed in any rulebook.]

Carry out taking inventory (this is the new print inventory rule):
	say "You are carrying: [line break]";
	list the contents of the player, with newlines, indented, including
		contents, with extra indentation.

After printing the name of something (called target) while taking inventory:
	follow the property-aggregation rules for the target.

[Carry out printing the name of something (this is the new name printing rule):
	say "[noun]".

After printing the name of a thing (called target):
	follow the property-aggregation rules for the target.]

The property-aggregation rules are an object-based rulebook.
The property-aggregation rulebook has a list of text called the tagline.

A first property-aggregation rule for an openable open thing (this is the
mention open openables rule):
	add "open" to the tagline.

A first property-aggregation rule for an openable closed thing (this is the
mention closed openables rule):
	add "closed" to the tagline.

A property-aggregation rule for a closed transparent container which contains
nothing (this is the mention empty transparent containers rule):
	add "empty" to the tagline.

A property-aggregation rule for an open container which contains nothing (this
is the mention empty open containers rule):
	add "empty" to the tagline.

A property-aggregation rule for a lit thing (this is the mention lit objects
rule):
	add "providing light" to the tagline.

A property-aggregation rule for a thing worn by the player (this is the
mention worn objects rule):
	add "being worn" to the tagline.

The last property-aggregation rule (this is the print aggregated properties
rule):
	if the number of entries in the tagline is greater than 0:
		say " ([tagline])";
		rule succeeds;
	rule fails.

Chapter 2 - Shopping

Section 1 - Prices

A price is a kind of value. 1000 cp (in cp) specifies a price.
100 sp (in sp) specifies a price scaled up by 10.
10 gp (in gp) specifies a price scaled up by 100.

A thing has a price. The price of a thing is usually 0 cp.
A thing has a price called worth. The worth of a thing is usually 0 cp

After examining a thing (called the item):
	if the item is for sale:
		say " ([price of the item])".

Definition: a thing is free if the price of it is 0 cp.
Definition: a thing is for sale if it is not free.

When play begins:
	repeat with item running through things:
		if the player does not hold the item:
			now the price of the item is the worth of the item.
	
Section 2 - Money

A coin is a kind of thing. A coin has a price called worth.
The size of a coin is tiny.

A copper coin is a kind of coin. The worth of a copper coin is 1 cp.
A silver coin is a kind of coin. The worth of a silver coin is 1.0 sp.
A gold coin is a kind of coin. The worth of a gold coin is 1.00 gp.
A platinum coin is a kind of coin. The worth of a platinum coin is 10.00 gp.

Instead of taking a coin (called the coin):
	say "Added [worth of the coin] to the coin purse.";
	increase the worth of the money by the worth of the coin.

Section 3 - Player's Coin Purse

The player carries a thing called the coin purse.
The size of the coin purse is small.
The coin purse contains a thing called money.
The size of the money is tiny.
The worth of the money is 25.00 gp.
The printed name of the money is "[worth of the money in gp]".
Understand "gp" and "gold" and "coins" as the money.

Before taking the money:
	say "Best to leave it alone until you need to buy something.";
	stop the action.

Instead of dropping the coin purse:
	say "Now why would you want to do that?"
Instead of inserting the coin purse into something:
	say "Now why would you want to do that?"
Instead of putting the coin purse on something:
	say "Now why would you want to do that?"
Instead of giving the coin purse to someone:
	say "You should really hold on to this."

Instead of buying the money:
	say "The coins belong to you; you buy things with them."

Section 4 - Buying

Before buying something:
	if the player has the noun:
		say "You already have that.";
		stop the action;
	otherwise if the noun is for sale:
		let the price be the price of the noun;
		if the price is greater than the worth of the money:
			say "[The noun] costs [the price]; you only have
				[the worth of the money]!";
			stop the action;
		otherwise:
			continue the action;
	otherwise:
		if the noun is a person:
			say "I don't think [the noun] needs money
				[italic type]that[roman type] badly.";
		otherwise:
			say "[The noun] isn't for sale.[conditional paragraph break]";
			if the noun is not fixed in place:
				say "You might be able to pick it up, though.";
		stop the action.

Instead of buying something:
	say "You pay [the price of the noun] and take [the noun].";
	decrease the worth of the money by the price;
	now the price of the noun is 0.00 gp;
	try taking the noun;

The can't steal things rule is listed before the cannot take large things rule in
the before rulebook.

Before taking a thing (called the product)
(this is the can't steal things rule):
	if the product is for sale:
		say "You can't just steal [the product]!";
		stop the action.

Chapter 3 - Combat

Section 1 - Attackable Things

A person has a number called maximum hit points.
A person has a number called current hit points.
The maximum hit points of a person is usually 10.
A person can be attackable. A person is usually not attackable.

Definition: A person is dead if its current hit points are less than 0 or
	it is in the spirit-world.

The player is attackable.

When play begins:
	repeat with victim running through people:
		now the current hit points of the victim is the maximum hit points of
			the victim;

A breakable container is a kind of container.
A breakable container has a number called maximum hit points.
A breakable container has a number called current hit points.
The maximum hit points of a breakable container is usually 10.
A breakable container is usually closed.
A breakable container is usually locked.
A breakable container is usually not lockable.
A breakable container is usually opaque.

The do not mention closed not openable breakable containers rule is listed
	after the mention closed openables rule in the property-aggregation rules.

A property-aggregation rule for a closed not openable breakable container
(this is the do not mention closed not openable breakable containers rule):
	if "closed" is listed in the tagline:
		say "Found";
		remove "closed" from the tagline.

A property-aggregation rule for a locked not lockable breakable container
(this is the do not mention locked not lockable breakable containers rule):
	if "locked" is listed in the tagline:
		remove "locked" from the tagline.

A property-aggregation rule for a broken breakable container
(this is the mention broken breakable containers rule):
	if "locked" is listed in the tagline:
		remove "locked" from the tagline;
	if "closed" is listed in the tagline:
		remove "closed" from the tagline;
	add "broken" to the tagline.

Definition: A breakable container is broken if its current hit points are less
	than 0.

When play begins:
	repeat with victim running through breakable containers:
		now the current hit points of the victim is the maximum hit points of
			the victim.

Section 2 - Corpses

A body is a kind of container. A body is part of every person.
Instead of touching a body: say "[The noun] is quite still."
A body is always open, not openable, and not lockable.

Spirit-possession relates one person to one body.
The verb to be owner of means the spirit-possession relation.

When play begins:
	repeat with victim running through people:
		let the corpse be a random body which is part of the victim;
		now the victim is owner of the corpse;
		now the printed name of the corpse is "corpse of [the victim]";
		now the description of the corpse is "The lifeless body of [the victim]".

[ Allow actions referring to a body refer to the person and vice/versa ]

Setting action variables when the noun is a body which
is part of a person (called owner):
	now the noun is the owner.

Setting action variables when the second noun is a body which
is part of a person (called owner):
	now the second noun is the owner.

Setting action variables when the noun is a dead person and
the noun is owner of a visible body (called the remains):
	now the noun is the remains.

Understand "corpse" as a body when the item described is not part of a person.

[ Have people "visible" when they are dead so their bodies can be interacted
  with without specifying "corpse" ]

The worldview is a privately-named backdrop. It is everywhere.
The spirit-world is a privately-named transparent closed unopenable container.
It is part of the worldview.

[ Before rules take place after action variables
  This will only happen if the corpse is not present ]
Before doing something to a dead person:
	say "[The noun] is dead; or did you forget about that?" instead.

[ Do not print contents of corpse ]
Rule for printing the name of a body (called the body):
	say "[printed name of the body]";
	omit contents in listing.

Section 3 - Diagnosing

Diagnosing is an action applying to one visible thing. Understand
	"diagnose [something]" as diagnosing.

Check diagnosing:
	if the noun is not attackable and the noun is not a breakable container,
		say "[The noun] seems fine to me." instead.

Carry out diagnosing:
	[ TODO: Make the description more fuzzy: "lively", "about to drop", etc. ]
	if the noun is attackable:
		say "[if the noun is the player]You have[otherwise][The noun] has[end if] [current hit points of the noun] out of a possible [maximum hit points of the noun] hit points remaining."

Carry out diagnosing:
	if the noun is a breakable container:
		say "[The noun] has [current hit points of the noun] out of a possible [maximum hit points of the noun] hit points remaining."

Section 4 - Weapons

A weapon is a kind of thing.
A weapon has a number called the maximum damage.
The maximum damage of a weapon is usually 1.
The size of a weapon is usually medium.

A property-aggregation rule for a weapon equipped by the player:
	add "equipped" to the tagline.

The wooden sword is a kind of weapon. The worth is 3.00 gp.
The maximum damage is 2. The size of a wooden sword is medium.
The steel sword is a kind of weapon. The worth is 10.00 gp.
The maximum damage is 6. The size of a steel sword is medium.
The mace is a kind of weapon. The worth is 6.00 gp.
The maximum damage is 6. The size of a mace is medium.
The morningstar is a kind of weapon. The worth is 12.00 gp.
The maximum damage is 8. The size of a morningstar is medium.
The dagger is a kind of weapon. The worth is 3.00 gp.
The maximum damage is 3. The size of a dagger is small.

Section 5 - Armors

An armor is a kind of thing.
An armor has a number called the defense rating.
The defense rating of an armor is usually 1.
An armor is wearable. The plural of armor is armor.
The size of an armor is usually medium.

A set of leather armor is a kind of armor. The worth is 10.00 gp.
The defense rating is 2. The size of a set of leather armor is medium.
The plural of set of leather armor is sets of leather armor.
A set of studded armor is a kind of armor. The worth is 25.00 gp.
The defense rating is 3. The size of a set of studded armor is medium.
The plural of set of studded armor is sets of studded armor.
A suit of chainmail is a kind of armor. The worth is 150.00 gp.
The defense rating is 6. The size of a suit of chainmail is medium.
The plural of set of chainmail is suits of chainmail.

Section 6 - Equipping

Equipping relates one weapon (called the equipped weapon) to one person.

Equipping it is an action applying to one carried thing.
Understand "equip [something]" as equipping it.

The verb to equip (he equips, they equip, he equipped, it is equipped) means
the reversed equipping relation.

Check an actor equipping:
	if the noun is a weapon:
		let the weapon size be the size of the noun;
		let the actor size be the size of the actor;
		if the noun is the equipped weapon of the actor:
			if the actor is the player:
				say "You already have [the noun] equipped.";
			stop the action;
		otherwise if actor equips something:
			if the actor is the player:
				say "You need to unequip [the noun] first.";
			stop the action;
		otherwise:
			unless the actor size is greater than the weapon size:
				if the actor is the player:
					say "It's too large to equip.";
				stop the action.

Carry out an actor equipping:
	if the noun is a weapon:
		now the actor equips the noun;
		if the actor is the player:
			say "You equip [the noun].";
	otherwise:
		try the actor wearing the noun.

Unequipping it is an action applying to one carried thing.
Understand "unequip [something]" as unequipping it.

Check an actor unequipping:
	if the noun is a weapon:
		unless the actor equips the noun:
			if the actor is the player:
				say "You don't have [the noun] equipped.";
			stop the action.

Carry out an actor unequipping:
	if the noun is a weapon:
		now the actor does not equip the noun;
	otherwise:
		try the actor taking off the noun.

Instead of wearing an armor when the player is wearing an armor
(called the other armor):
	say "You'll have to remove [the other armor] first."

Section 7 - Attacking

Before an actor attacking something:
	if the noun is not attackable and the noun is not a breakable container:
		say "Violence is not the answer to this one.";
		stop the action.
	
Instead of an actor attacking something:
	let the damage inflicted be one;
	let the weapon be "bare fists";
	if the actor equips a weapon:
		let the weapon be "[the equipped weapon of the actor]";
		let the maximum attack be the maximum damage of the equipped weapon
		of the actor;
		now the damage inflicted is a random number between 1 and the maximum
		attack;
	decrease the current hit points of the noun by the damage inflicted;
	say "[The actor] hit [the noun] with [the weapon]!";
	if the noun is dead:
		let the corpse be a random body which is part of the noun;
		move the corpse to the location;
		repeat with the item running through the things carried by the noun:
			now the item is in the corpse;
		move the noun to the spirit-world;
		if the actor is the player:
			say "You killed [the noun]!";
	otherwise if the noun is broken:
		say "[A list of things in the noun] fell out of the broken [noun]!";
		repeat with item running through things in the noun:
			move the item to the location of the player;
			now the noun is nowhere.


Chapter 4 - Food and Drinks

Section 1 - Food

A food is a kind of thing. It has some text called the food description.
The size of a food is usually tiny.

[ TODO: Implement lowering size category ]
Instead of eating a food (called the food):
	now the food is nowhere;
	say "[the food description of the food][paragraph break]";

[ TODO: Make different kinds of food ]

Section 2 - Drinks

A fluid container is a kind of container.
A fluid container has a number called a fluid capacity.
A fluid container has a number called current volume.

Fluid is a kind of value. The fluids are water and mead.
A fluid container has a fluid. A fluid has a text called the description.
A fluid has a text called the drinking description.

Understand "drink from [fluid container]" as drinking.

Instead of drinking a fluid container (called the drink):
	let the fluid be the fluid of the drink;
	if the drink is empty:
		say "There is no more [fluid of the drink] left." instead;
	otherwise:
		decrease the current volume of the drink by one;
		if the current volume of the drink is less than 0:
			now the current volume of the drink is 0;
		say "[The drinking description of the fluid][paragraph break]";

Before printing the name of a fluid container (called the cup) while not
drinking:
	if the cup is empty:
		say "empty ";
	otherwise:
		do nothing.

After printing the name of a fluid container (called the cup) while not
examining:
	unless the cup is empty:
		say " of [fluid of the cup]";
	omit contents in listing.

Before examining a fluid container (called the cup):
	if the fluid container is not empty:
		say "Inside, you see [description of the fluid of the cup][paragraph break]";
		stop the action.

Definition: a fluid container is empty if the current volume of it is 0.
Definition: a fluid container is full if the current volume of it is the
fluid capacity of it.

The description of mead is "a clear liquid with a light amber color. It
smells sweet and faintly fruity."
The drinking description of mead is "A strong taste of honey and apples
coats your tongue. The mead goes down smoothly. When you finish, you can
still taste its sweetness."

A tankard is a kind of fluid container. The size of a tankard is always small.
The fluid capacity of a tankard is 5.
The current volume of a tankard is 5.

A tankard of mead is a kind of tankard.
The fluid of a tankard of mead is always mead.

[ TODO: Make different kinds of drinks ]

Part 2 - The Town

[ The Town ]

The Town Square is a room. "The center of town, the town square is where all of
the shopping and socializing happens. To the west is the inn, where you can
hear people laughing and having a good time. To the east is the armory, where
you can buy weapons and armor. To the north are the training grounds, where you
can hack away at straw dummies for fun.[first time][paragraph break]You find a pamphlet titled README on ground and pick it up. You might read it later during
some down time.[only]".

A bulletin board is here. "There is a bulletin board just outside the inn, with
papers and posters stuck to it indicating quests people can take."
The bulletin board is a supporter. It is fixed in place.

The player carries a reading material called a README.
The description of the README is "A pamphlet about the town and something
called 'Interactive Fiction'...".
The print of the README is "Welcome to the Demo Town!

There isn't a lot to do in this little town, but there's enough to get
yourself familiar with the area. We've got an Inn with rooms for you to stay
in, an Armory if you want to outfit yourself for battle, and Training Grounds
where you can practice fighting a Training Dummy.

IF YOU ARE NEW TO INTERACTIVE FICTION:

Interactive Fiction is a format that generally expects players to enter
commands in the following sorts of forms:

(VERB)[line break]
(VERB) (NOUN)[line break]
(VERB) (NOUN) WITH (NOUN)

Other forms of commands can be defined, but these are the most common.
Note that commands are not case sensitive, but for the purposes of this
README they will be indicated in ALL CAPS.

To move between 'rooms', use the GO command, followed by a direction.
For instance, GO NORTH or GO EAST. To traverse stairs, GO UP or GO DOWN.
If you come across something you can climb into, GO INTO or GO OUT.

You can buy some things, if you have money. To buy an item, BUY (ITEM NAME).
You can buy weapons and armor in the Armory. You can EQUIP (WEAPON) and
EQUIP (ARMOR) or WEAR (ARMOR).

To unlock a door or container, use UNLOCK (THING) WITH (KEY). The command USE
(KEY) will [italic type]not[roman type] work. You can later lock the door
or container with LOCK (THING) WITH (KEY).

To attack someone/something, any of the following will work:

ATTACK (THING)[line break]
FIGHT (THING)[line break]
BREAK (THING)[line break]
And other synonyms for wanting to cause damage to someone or something.
"

[ TODO: Add quests to the bulletin board ]

[ The Inn ]

The Inn is west of the town square. "It's hard to hear anything in the inn over
the sounds of drunk, raucous laughter and bards playing ambient music to keep
spirits high. A wooden staircase runs up one wall to a second floor, where
people can sleep in rooms rented to them by the barkeep."

[ TODO: Add greeting text and ability to talk to barkeep. Also a nod when player enters room ]
The barkeep is a man in the Inn. "A barkeep stands behind the counter,
[one of]pouring drinks[or]wiping up a spill[at random][first time]. He gives
you a polite nod as you enter[only]."
The description is "He notices you looking and, seeing you don't need anything,
goes back to work."

[ TODO: Add hurried greeting and ability to talk to - on break? ]
The barmaid is a woman in the Inn. "A barmaid expertly navigates the scattered
tables and avoids enthusiastically waving arms as she delivers drinks to
waiting customers."

The board of keys is scenery in the inn. The size of the board of keys is large.
On the board of keys is a thing called the room key.
The worth of the room key is 0.50 gp. The size of the room key is tiny.
Understand "key" and "the key" as the room key.
Understand "key board" as the board of keys.

The counter is scenery in the Inn. On the counter is a tankard of mead called
a tankard.

The message board is a reading material in the Inn. It is fixed in place.
The description of the message board is
"[print of the message board]".
The print of the message board is
"ROOMS: [worth of the room key]".

Before going east from the inn:
	If the barkeep does not have the room key:
		say "The barkeep stops you before you can leave. 'I'm going to need
			you to return your key before you leave,' he tells you.";
		stop the action.

After going from the Inn:
	If the barkeep has the room key:
		Now the room key is on the board of keys;
		Now the price of the room key is the worth of the room key;
	continue the action.

[ THE HALLWAY OF THE INN ]

The wooden staircase is above the Inn and below the Hallway of the Inn.
The staircase is an open door. The staircase is not openable.

[The Hallway of the Inn is a room above the inn.]
The description of the hallway is "A simple, undecorated hallway with closed
doors leading to many rooms.[if the player has the room key] To the north,
you can see the room you rented.[end if]"

[ TODO: Deal with a player wanting to take any part of the bed. ]

The room door is north of the hallway and south of the Rented Bedroom.
The room door is a door. It is closed and locked.
The room key unlocks the room door.

The description of the Rented Bedroom is "You see a plain wooden bed with
simple sheets, a sturdy mattress, a blanket, and a pillow. One window to the
north looks over part of the town. A locked chest in the corner awaits any
belongings you want to store inside it."

The chest is a closed, locked, openable, lockable breakable container in
the rented bedroom.
The room key unlocks the chest. The size of the chest is medium.
The chest is fixed in place.

The bed is fixed in place in the rented bedroom.

[ The Armory ]

The Armory is east of the town square. "Shelves and racks contain various kinds
of weapons and armor. Behind the counter stands a man with a neatly-trimmed
beard and a blacksmith's apron. You can feel heat radiating from the back,
where the smithy seems to be."

The shelves and racks are in the Armory. The shelves supports five wooden
swords and three steel swords and two maces and one morningstar. The racks
supports three sets of leather armor and one set of studded armor and one
suit of chainmail. 

[ The Training Grounds ]

The Training Grounds are north of the town square. "Straw dummies line on side
of the grounds while a few people practice their swordfighting on the other
side."

A person called the Training Dummy is here. The dummy is attackable.
The dummy carries a tattered mess of straw. The maximum hit points is 10.
The dummy is fixed in place.

Rule for deciding the concealed possessions of the Training Dummy:
	if the dummy is dead, no; otherwise yes.

[ Respawn the dummy when the player leaves ]
After going from the training grounds:
	Now the current hit points of the dummy is the maximum hit points of the
	dummy;
	Now the dummy contains a tattered mess of straw;
	Now the dummy is in the training grounds;
	continue the action.
