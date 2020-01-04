Arma 3 script that all of the vehicle guns "Most" are usable when equiped however some of the cannons seem not to work
if your running this on a server there is a fuctions file and a run file if you want just one client to run it then add {publicVariable "RECREATEVAR"} and do {call recreate} on each client
if your running it single player or just for yourself you can copy and paste the pasteable file straight into debug and it will work
the way you equip the guns is dropping them on the floor from your inventory and pick them up as if they were a gun on the ground this should make you hold it in your hand and give you the option to fire it
warning this will cause alot of lag and even more lag with addition mods as it runs through all of cfgweapons
if you want to repoen it run {call recreate} and it will reopen the menu with all the previous weapons
