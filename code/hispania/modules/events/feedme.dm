/datum/event/feedme
	announceWhen = 3

/datum/event/spawn_feedme/announce()
	GLOB.event_announcement.Announce("vino la criatura")

/mob/living/simple_animal/feedme
	name = "feedme"
	desc = "A small parasitic creature that would like to connect with your brain stem."
	icon = 'icons/hispania/mob/headcrab.dmi'
	icon_state = "headcrab"
	icon_living = "headcrab"
	icon_dead = "headcrab_dead"
	health = 60
	maxHealth = 60
	nutrition = -9000
	metabolism_efficiency = 100
	var/turns_since_scan = 0
	var/obj/movement_target
	var/alimentado = 0

/mob/living/simple_animal/feedme/handle_automated_movement()
	. = ..()
	//Feeding, chasing food, FOOOOODDDD
	if(resting)
		return

	if(++turns_since_scan > 5)
		turns_since_scan = 0

		// Has a target, but it's not where it was before, and it wasn't picked up by someone.
		if(movement_target && !(isturf(movement_target.loc) || ishuman(movement_target.loc)))
			movement_target = null
			stop_automated_movement = FALSE

		// No current target, or current target is out of range.
		var/list/snack_range = oview(src, 3)
		if(!movement_target || !(movement_target.loc in snack_range))
			movement_target = null
			stop_automated_movement = FALSE
			var/obj/item/possible_target = null
			for(var/I in snack_range)
				if(istype(I, /obj/item/reagent_containers/food/snacks)) // Noms
					possible_target = I
					break
				else if(istype(I, /obj/item/paper)) // Important noms
					if(prob(10))
						possible_target = I
						break
			if(possible_target && (isturf(possible_target.loc) || ishuman(possible_target.loc))) // On the ground or in someone's hand.
				movement_target = possible_target
		if(movement_target)
			INVOKE_ASYNC(src, .proc/move_to_target)

/mob/living/simple_animal/feedme/proc/move_to_target()
	stop_automated_movement = TRUE
	step_to(src, movement_target, 1)
	sleep(3)
	step_to(src, movement_target, 1)
	sleep(3)
	step_to(src, movement_target, 1)

	if(movement_target) // Not redundant due to sleeps, Item can be gone in 6 deciseconds
		// Face towards the thing
		dir = get_dir(src, movement_target)

		if(!Adjacent(movement_target)) //can't reach food through windows.
			return

		if(isturf(movement_target.loc))
			movement_target.attack_animal(src) // Eat the thing
		else if(prob(30) && ishuman(movement_target.loc)) // mean hooman has stolen it
			custom_emote(EMOTE_VISUAL, "stares at [movement_target.loc]'s [movement_target] with a sad puppy-face.")

/datum/event/spawn_feedme/start()
	new /mob/living/simple_animal/feedme(pick(GLOB.feedmespawn))
