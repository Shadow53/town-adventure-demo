Food And Drinks by Michael Bryant begins here.

Include Sizes by Michael Bryant.

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

Fluid is a kind of value.
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

Food And Drinks ends here.
