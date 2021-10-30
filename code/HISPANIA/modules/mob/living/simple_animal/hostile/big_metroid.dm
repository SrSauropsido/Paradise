/mob/living/simple_animal/hostile/megafauna/adult_metroid
	name = "adult metroid"
	desc = "Adult Metroid, an adult version of a deadly metroid. This has reached a large size after devouring many prey."
	icon = 'icons/hispania/mob/big_metroid.dmi'
	icon_state = "big_metroid"
	icon_living = "big_metroid"
	icon_dead = "big_metroid_dead"
	icon_gib = "syndicate_gib"
	death_sound = 'sound/voice/hiss6.ogg'
	deathmessage = "After an agonized screech, his armor becomes brittle and hardens as his jaws clench..."
	bubble_icon = "alien"
	gender = NEUTER

	vision_range = 4
	speed = 3
	move_to_delay = 4
	maxHealth = 1000
	health = 1000
	harm_intent_damage = 5
	melee_damage_lower = 60
	melee_damage_upper = 60
	obj_damage = 100
	attacktext = "crushes"
	attack_sound = 'sound/weapons/bite.ogg'
	a_intent = INTENT_HARM

	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 5000
	faction = list("metroid")
	flying = TRUE
	pressure_resistance = 2000

	speak_emote = list("hisses")
	status_flags = PASSTABLE
	response_help  = "pets"
	response_harm   = "hits"
	stat_attack = 1
	flying = TRUE
	robust_searching = 1
	light_range = 5
	light_power = 2.5
	light_color = LIGHT_COLOR_GREEN
	aggro_vision_range = 9

	var/Tempstun = 0 // temporary temperature stuns
	var/SStun = 0 // stun variable


/mob/living/simple_animal/hostile/megafauna/adult_metroid/Process_Spacemove(movement_dir = 0)
	return TRUE

/mob/living/simple_animal/hostile/megafauna/adult_metroid/handle_environment(datum/gas_mixture/environment)
	if(!environment)
		return

	var/loc_temp = get_temperature(environment)

	adjust_bodytemperature(adjust_body_temperature(bodytemperature, loc_temp, 1))

	//Account for massive pressure differences

	if(bodytemperature < (T0C + 5)) // start calculating temperature damage etc
		if(bodytemperature <= (T0C - 40)) // stun temperature
			Tempstun = 1

		if(bodytemperature <= (T0C - 50)) // hurt temperature
			if(bodytemperature <= 50) // sqrting negative numbers is bad
				adjustBruteLoss(200)
			else
				adjustBruteLoss(round(sqrt(bodytemperature)) * 2)

	else
		Tempstun = 0

	updatehealth("handle environment")


	return //TODO: DEFERRED

/mob/living/simple_animal/hostile/megafauna/adult_metroid/proc/adjust_body_temperature(current, loc_temp, boost)
	var/temperature = current
	var/difference = abs(current - loc_temp)	//get difference
	var/increments// = difference/10			//find how many increments apart they are
	if(difference > 50)
		increments = difference / 5
	else
		increments = difference / 10
	var/change = increments * boost	// Get the amount to change by (x per increment)
	var/temp_change
	if(current < loc_temp)
		temperature = min(loc_temp, temperature+change)
	else if(current > loc_temp)
		temperature = max(loc_temp, temperature-change)
	temp_change = (temperature - current)
	return temp_change
