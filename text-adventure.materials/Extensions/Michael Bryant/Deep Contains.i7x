Deep Contains by Michael Bryant begins here.

"Some helper rules to determine if the player or a container contains an item
inside of another container."

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

Deep Contains ends here.
