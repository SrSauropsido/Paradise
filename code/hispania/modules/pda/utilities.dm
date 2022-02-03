/datum/data/pda/utility/trombone/ //Sadtrombone by Bawz
	name = "Sad Trombone"
	icon = "smile-o"
	category = "Clown"

	var/last_bone //based copypaste

/datum/data/pda/utility/trombone/start()
	if(!(last_bone && world.time < last_bone + 40))
		playsound(pda.loc, 'sound/misc/sadtrombone.ogg', 50, 1)
		last_bone = world.time
