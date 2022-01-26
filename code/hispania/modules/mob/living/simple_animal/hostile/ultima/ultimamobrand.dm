/mob/living/simple_animal/hostile/ultima/ultimamobrand
	name = "ultimamobrand"
	desc = "It's a random mob? You're not supposed to see this."
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "legion"
	icon_living = "legion"
	icon_dead = "legion"
	mob_biotypes = MOB_ORGANIC | MOB_BEAST
	move_to_delay = 10
	maxHealth = 10
	health = 10
	harm_intent_damage = 5
	obj_damage = 30
	melee_damage_lower = 1
	melee_damage_upper = 1
	attacktext = "chomps"
	attack_sound = 'sound/weapons/bite.ogg'
	environment_smash = 0
	speed = 0
	robust_searching = 1

/mob/living/simple_animal/hostile/ultima/ultimamobrand/New()//Cada mob es un poquito unico.
	melee_damage_lower += rand(5, 15)
	melee_damage_upper += rand(20,40)
	maxHealth += rand(40,1000)
	move_to_delay = rand(5,10)
	var/icon_staterand = rand(1,3)
	health = maxHealth

	if(maxHealth < 90) //Mas vida tiene, mas lento es.
		speed += 1
		move_to_delay += 10
	if(maxHealth < 290)
		speed += 1
		move_to_delay += 10
	if(maxHealth < 590)
		speed += 1
		move_to_delay += 10
	if(maxHealth < 790)
		speed += 1
		move_to_delay += 10

	if(icon_staterand == 1)
		name = "Random Goliath"
		desc = "It's a random goliath!"
		icon_state = "Goliath"
		icon_living = "Goliath"
		icon_dead = "Goliath_dead"
		faction += "ultima1"
	if(icon_staterand == 2)
		name = "Random Basilisk"
		desc = "It's a random basilisk!"
		icon_state = "Basilisk_alert"
		icon_living = "Basilisk_alert"
		icon_dead = "Basilisk_dead"
		faction += "ultima2"
	if(icon_staterand == 3)
		name = "Random Goldgrub"
		desc = "It's a random goldgrub!"
		icon_state = "Goldgrub"
		icon_living = "Goldgrub"
		icon_dead = "Goldgrub_dead"
		faction += "ultima3"

	..()