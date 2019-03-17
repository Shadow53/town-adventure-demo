Combat And Breakable Containers by Michael Bryant begins here.

Chapter 1 - Weapons

A weapon is a kind of thing.
A weapon has a number called the maximum damage.
The maximum damage of a weapon is usually 1.

A property-aggregation rule for a weapon equipped by the player:
	add "equipped" to the tagline.

The bare fists are a weapon. The maximum damage is 1.
The bare fists are nowhere.

Section 1 (for use with Sizes by Michael Bryant)

The size of a weapon is usually medium.

Chapter 2 - Armors

An armor is a kind of thing.
An armor has a number called the defense rating.
The defense rating of an armor is usually 1.
An armor is wearable. The plural of armor is armor.

Section 1 (for use with Sizes by Michael Bryant)

The size of an armor is usually medium.

Chapter 3 - Attackable Things

[Things are destructible because they generally are not attackable
and, if it is attackable, it's usually because it's destructible]
A thing has a number called maximum hit points.
A thing has a number called current hit points.
A thing can be attackable. A thing is usually not attackable.
A thing can be destructible or indestructible.
A thing is usually destructible.

Default weapon relates various things to a weapon (called the default weapon).
The verb to default-weapon (he default-weapons, they default-weapon,
	he default-weaponed, it is default-weaponing) means the default weapon
	relation.

Definition: a thing is retaliatory if it default-weapons something or
	it equips a weapon.

The maximum hit points of a thing is usually 5.
The maximum hit points of a container is usually 10.
The maximum hit points of a person is usually 20.

Definition: A container is breakable if it is destructible.

Definition: A container is broken if its current hit points are less than 0.

Definition: A person is killable if it is destructible.

Definition: A person is dead if it is killable and its current hit points are
	less than 0 or it is in the spirit-world.

Definition: A person is defeated if it is not killable and its current hit points
	are less than 0.

The player is attackable. The player is destructible.
The player default-weapons the bare fists.

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

When play begins:
	repeat with victim running through things:
		now the current hit points of the victim is the maximum hit points of
			the victim;

Section 1 (for use with Human Beings by Michael Bryant)

When play begins (this is the all humans have bare fists rule):
	repeat with victim running through human beings:
		if the victim does not default-weapon something:
			now the victim default-weapons the bare fists.

Section 2 (for use without Human Beings by Michael Bryant)

When play begins (this is the all people have bare fists rule):
	repeat with victim running through people:
		if the victim does not default-weapon something:
			the victim default-weapons bare fists.

Chapter 4 - Corpses

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

Chapter 5 - Diagnosing

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

Chapter 6 - Equipping

Equipping relates one weapon (called the equipped weapon) to one person.

Equipping it is an action applying to one carried thing.
Understand "equip [something]" as equipping it.

The verb to equip (he equips, they equip, he equipped, it is equipped) means
the reversed equipping relation.

Check an actor equipping (this is the only equip weapons and armor rule):
	if the noun is not a weapon and the noun is not an armor:
		stop the action.

Check an actor equipping (this is the cannot equip equipped items rule):
	if the noun is the equipped weapon of the actor:
		if the actor is the player:
			say "You already have [the noun] equipped.";
		stop the action;

Check an actor equipping
(this is the cannot equip with something else equipped rule):
	if actor equips something:
		if the actor is the player:
			say "You need to unequip [the noun] first.";
		stop the action;

Section 1 (for use with Sizes by Michael Bryant)

Check an actor equipping (this is the equip the right size rule):
	let the weapon size be the size of the noun;
	let the actor size be the size of the actor;
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

Check an actor unequipping (this is the cannot unequip non-equipped things rule):
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

Chapter 7 - Attacking

Understand the commands "attack" and "punch" and "destroy" and "kill" and
"murder" and "hit" and "thump" and "break" and "smash" and "torture" and
"wreck" as something new. 

Damaging is an action applying to one visible thing.
Understand "attack [something]" as damaging.

Understand the commands "punch" and "destroy" and "kill" and "murder" and
"hit" and "thump" and "break" and "smash" and "torture" and "wreck" as "attack". 

[This definition allows us to adaptively use the word "attack"]
To attack (he attacks, they attack, he attacked, it is being attacked) is a verb.
To run away (he runs away, they run away, he ran away, it is running away)
	is a verb.

The damaging action has a number called the damage inflicted.
The damaging action has a weapon called the weapon damaged with.

Setting action variables for damaging:
	now the damage inflicted is one;
	if the actor equips a weapon:
		now the weapon damaged with is the equipped weapon of the actor;
	otherwise if the actor default-weapons a weapon:
		now the weapon damaged with is the default weapon of the actor;
	let the maximum attack be the maximum damage of the weapon damaged with;
	now the damage inflicted is a random number between 1 and the maximum
	attack;

Check an actor damaging something (this is the cannot attack all things rule):
	if the noun is not attackable:
		say "Violence is not the answer to this one.";
		stop the action.
	
Check an actor damaging something (this is the cannot attack dead things rule):
	if the noun is dead:
		say "[regarding the noun][They] [are] already dead; hitting [them]
			again will do nothing.";
		stop the action.

Check an actor damaging something (this is the cannot attack defeated things rule):
	if the noun is defeated:
		say "[The actor] [have] already defeated [regarding the noun][them];
			killing [them] would do nothing.";
		stop the action.

Check an actor damaging something (this is the cannot attack broken things rule):
	if the noun is broken:
		say "[regarding the noun][They] [are] already broken and there are
			better ways of getting your anger out.";
		stop the action.

Check the player damaging the player (this is the cannot attack yourself rule):
	say "Please don't do that; I rather like having you around.";
	stop the action.

Check an actor damaging something
(this is the cannot attack without a default weapon rule):
	if the actor does not equip a weapon:
		if the actor does not default-weapon a weapon:
			say "[The actor] [have] nothing to attack with!";
			stop the action.

Carry out an actor damaging something:
	decrease the current hit points of the noun by the damage inflicted;
	if the noun is dead:
		let the corpse be a random body which is part of the noun;
		move the corpse to the location;
		repeat with the item running through the things carried by the noun:
			now the item is in the corpse;
		move the noun to the spirit-world;
	otherwise if the noun is broken:
		repeat with item running through things in the noun:
			move the item to the location of the player;
			now the noun is nowhere.

Report damaging a dead person (this is the death-report priority rule):
	say "[We] [attack] with [our] [weapon damaged with], killing [the noun]!"
		instead.

Report damaging a defeated person
(this is the defeat-report priority rule):
	say "[We] [attack] with [our] [weapon damaged with]. [The noun] lies defeated
		before [us]." instead.

Report damaging someone (this is the normal damaging report rule):
	say "[We] [attack] [the noun] with [our] [weapon damaged with]!".

Report someone damaging the player when the player is dead
(this is the player's-death priority rule):
	say "[The actor] [attack] [us] with [their] [weapon damaged with],
		finishing [us] off!";
	end the story;
	stop the action.

Report someone damaging the player when the player is defeated
(this is the player's-defeat priority rule):
	say "[The actor] [attack] [us] with [their] [weapon damaged with].
		[we] [are] knocked to the ground, no longer able to fight!"

Report someone damaging the player
(this is the standard report someone damaging the player rule):
	say "[The actor] [attack] [us] with [regarding the actor][their]
		[weapon damaged with]!" instead.

Report someone damaging something (this is the standard report damaging rule):
	say "[The actor] [attack] [the noun] with [regarding the actor][their]
		[the weapon damaged with]." instead.

Before attacking a person (this is the automatically target enemies rule):
	if the noun is not dead and the noun is not defeated:
		if the player is not targeting the noun:
			now the player is targeting the noun;
			now the right hand status line is "Fighting: [the noun]";
	otherwise:
		now the player is not targeting the noun;
		now the right hand status line is "";
	continue the action.

Chapter 8 - NPCs Attacking the Player

Targeting relates various people to one person (called the target).

The verb to target means the targeting relation.

Every turn (this is the NPCs attack their targets rule):
	repeat with the actor running through people that are attackable:
		if the actor is not dead and the actor is not defeated:
			if the actor is targeting someone and the actor is retaliatory:
				let the victim be the target of the actor;
				if the victim is attackable:
					if the victim is not dead:
						if the location of the actor is not the location of the victim:
							let the way be the best route from the location of the
								actor to the location of the victim, using doors;
							try the actor going the way;
						otherwise:
							try the actor damaging the victim;
					otherwise:
						now the actor does not target the victim;
				otherwise:
					now the actor does not target the victim.

After an actor damaging a person (called the victim):
	if the victim is not the player and the victim is not targeting the actor:
		if the victim is retaliatory:
			let the new target be "[the actor]";
			if the actor is the player:
				now the new target is "[us]";
			say "[The victim] sets [their] eyes on [the new target].";
			now the victim is targeting the actor;
	continue the action.

Combat And Breakable Containers ends here.
