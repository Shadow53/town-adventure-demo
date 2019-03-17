"The Demo Town" by Michael Bryant

Part 1 - Defining the Rules

Chapter 1 - Basic Rules

Section 1 - Basic Settings

Use serial comma.
Use UNDO prevention. [ Prevent player undoing actions ]
The block giving rule is not listed in the check giving it to rules.

Include Sizes by Michael Bryant.
Include Combat And Breakable Containers by Michael Bryant.
Include Deep Contains by Michael Bryant.
Include Fantasy Shopping by Michael Bryant.
Include Food And Drinks by Michael Bryant.
Include Human Beings by Michael Bryant.
Include Inventory Listings by Michael Bryant.
Include Reading by Michael Bryant.

Chapter 3 - Combat

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

A set of leather armor is a kind of armor. The worth is 10.00 gp.
The defense rating is 2. The size of a set of leather armor is medium.
The plural of set of leather armor is sets of leather armor.
A set of studded armor is a kind of armor. The worth is 25.00 gp.
The defense rating is 3. The size of a set of studded armor is medium.
The plural of set of studded armor is sets of studded armor.
A suit of chainmail is a kind of armor. The worth is 150.00 gp.
The defense rating is 6. The size of a suit of chainmail is medium.
The plural of set of chainmail is suits of chainmail.

Chapter 4 - Food and Drinks

The fluids are water and mead.

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

The Inn is a region.

The Dining Room of the Inn is west of the town square.
"It's hard to hear anything in the inn over
the sounds of drunk, raucous laughter and bards playing ambient music to keep
spirits high. A wooden staircase runs up one wall to a second floor, where
people can sleep in rooms rented to them by the barkeep."

[ TODO: Add greeting text and ability to talk to barkeep. Also a nod when player enters room ]
The barkeep is a man in the Dining Room of the Inn.
"A barkeep stands behind the counter,
[one of]pouring drinks[or]wiping up a spill[at random][first time]. He gives
you a polite nod as you enter[only]."
The description is "He notices you looking and, seeing you don't need anything,
goes back to work."

[ TODO: Add hurried greeting and ability to talk to - on break? ]
The barmaid is a woman in the Dining Room of the Inn.
"A barmaid expertly navigates the scattered
tables and avoids enthusiastically waving arms as she delivers drinks to
waiting customers."

The board of keys is scenery in the Dining Room of the Inn.
The size of the board of keys is large.
On the board of keys is a thing called the room key.
The worth of the room key is 0.50 gp. The size of the room key is tiny.
Understand "key" and "the key" as the room key.
Understand "key board" as the board of keys.

The counter is scenery in the Dining Room of the Inn.
On the counter is a tankard of mead called a tankard.

The message board is a reading material in the Dining Room of the Inn.
It is fixed in place.
The description of the message board is
"[print of the message board]".
The print of the message board is
"ROOMS: [worth of the room key]".

[ THE HALLWAY OF THE INN ]

The wooden staircase is above the Dining Room of the  Inn and below the
Hallway of the Inn.
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

The chest is a closed, locked, openable, lockable container in
the rented bedroom. The chest is destructible.
The room key unlocks the chest. The size of the chest is medium.
The chest is fixed in place.

The bed is fixed in place in the rented bedroom.

The Dining Room of the Inn, the Hallway of the Inn, and
the Rented Bedroom are in the Inn.

Before going to a room not in the Inn:
	If the barkeep does not have the room key and the room key is not
	on the board of keys:
		say "You need to return the room key before you leave.";
		stop the action.

After going to a room not in the Inn:
	If the barkeep has the room key:
		Now the room key is on the board of keys;
		Now the price of the room key is the worth of the room key;
		Now the room door is locked;
		Now the chest is locked;
	continue the action.

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

The Training Dummy is here. The dummy is attackable. The dummy is destructible.
The dummy carries a tattered mess of straw. The maximum hit points is 10.
The dummy is fixed in place.

A person called Axel is here. Axel is attackable. Axel is indestructible.
Axel carries a wooden sword and leather armor. Axel equips the wooden sword.
Axel wears the leather armor. The maximum hit points of Axel is 10.
Axel is fixed in place.

Rule for deciding the concealed possessions of the Training Dummy:
	if the dummy is dead, no; otherwise yes.

[ Respawn the dummy when the player leaves ]
After going from the training grounds:
	Now the current hit points of the dummy is the maximum hit points of the
	dummy;
	Now the dummy contains a tattered mess of straw;
	Now the dummy is in the training grounds;
	continue the action.
	
Axel's Training is a recurring scene.
Axel's Training begins when Axel targets the player.
Axel's Training ends honorably when the player is defeated.
Axel's Training ends proudly when Axel is defeated.
Axel's Training ends cowardly when the location of the player is not the
	location of Axel.

When Axel's Training begins:
	now the player is indestructible.

When Axel's Training ends:
	now the current hit points of Axel is the maximum hit points of Axel;
	now the current hit points of the player is the maximum hit points
		of the player;
	now Axel is not targeting the player;
	now the player is not targeting Axel;
	now the player is destructible.

When Axel's Training ends honorably:
	let the way be the best route from the Town Square to the Armory;
	say "Axel offers you a hand and helps you back onto your feet.";
	say "'You fought well,' he tells you. 'You could[one of][or]
		still[stopping] use some more practice, though. Or a better weapon
		or armor. You can buy something from the armory [way] of town square.'"

When Axel's Training ends proudly:
	say "You and Axel both sit down on a nearby bench to catch your breath.
		After some time, Axel stands and offers you a hand.";
	say "'You hit hard,' he admits. 'And you can take a few hits yourself.
		I'd say you'd got the makings of a fine warrior yet.' He laughs.
		'Who knows, maybe someday you'll be the one training me, huh?'"

When Axel's Training ends cowardly:
	say "As [we] [run away] from the fight, [we] hear Axel mutter to himself
		about people who 'can't take training seriously.'".

Test axel with "e / buy leather / buy steel / equip sword / equip armor / w / n / attack axel".
