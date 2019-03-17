Fantasy Shopping by Michael Bryant begins here.

Include Sizes by Michael Bryant.

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
	try silently taking the noun;

The can't steal things rule is listed before the cannot take large things rule in
the before rulebook.

Before taking a thing (called the product)
(this is the can't steal things rule):
	if the product is for sale:
		say "You can't just steal [the product]!";
		stop the action.

Fantasy Shopping ends here.
