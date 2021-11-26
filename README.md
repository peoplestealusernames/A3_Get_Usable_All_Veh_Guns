An Arma 3 script that reads through the game config to get guns that can be fired but are not avaliable in the arsenal.
This runs off an exploit and is based off a christmas special from liru about firing hydra pods as a player

## How it works
I ran a config custom config compairer to find what configs are the same in the glich weapons to find other that could also work.
This goes through all of CfgWeapons to find anything with the same values and shows a menu with them in it.

## How to use
### With debug console
Copy and paste the Pasteable.txt into your console

### With sqfs
Copy FNCS.sqf and Run.sqf exec Run.sqf

### Reopening
With either method you can run {call recreate} to reopen the menu without prasing all of CfgWeapons again

### Equiping the guns
#1 From the menu it puts them in your inventory
#2 Drop the weapon on the ground
#3 Use the action menu to pick it up (It should act like you picked up a weapon)
#4 Enjoy

[A clip from liru showing this](https://youtu.be/y0DSPSOz9w4?t=735)

# WARNING!
#1 this will cause alot of lag and even more lag with addition mods as it runs through all of cfgweapons
#2 some of these dont work dagr for sure so use them for testing to make sure your doing it right

## Server side
If your doing this on a server dont put it on init or join, as it may crash games or cause player drop on joining
Instead run it on one client or server side then use {publicVariable "RECREATEVAR"} it will pass the end result to all clients
Using {call recreate} will open the menu if you already ran FNCS.sqf
