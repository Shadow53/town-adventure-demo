Inventory Listings by Michael Bryant begin here.

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

Inventory Listings end here.
