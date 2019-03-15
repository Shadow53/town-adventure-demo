Combat And Breakable Containers by Michael Bryant begins here.

Include Sizes by Michael Bryant.

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

Section 5 - Armors

An armor is a kind of thing.
An armor has a number called the defense rating.
The defense rating of an armor is usually 1.
An armor is wearable. The plural of armor is armor.
The size of an armor is usually medium.

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

Combat And Breakable Containers ends here.
