/obj/item/maracas
	name = "maracas"
	desc = "Rather than using beads in a hollow shell, these space maracas use a long-life WATT potassium battery and a sensor to detect when they're shaken. Chick-chicky-boom, chick-chicky boom."
	icon = 'icons/hispania/obj/maracas.dmi'
	icon_state = "maracas"
	item_state = "maracas"
	lefthand_file = 'icons/hispania/mob/inhands/maracas_lefthand.dmi'
	righthand_file = 'icons/hispania/mob/inhands/maracas_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL

/obj/item/maracas/cubanpete
	name = "Cuban Pete's maracas"
	emagged = TRUE

/obj/item/maracas/emag_act(mob/user)
	if(!emagged)
		to_chat(user,"<span class='danger'>You disable the safety thermal controls of the maraca. Be careful when you throw it.</span>")
		emagged = TRUE

/obj/item/maracas/throw_impact(atom/hit_atom, var/speed, var/mob/user)
	if(emagged)
		log_game("[key_name(user)] triggered a explosion at [COORD(loc)]")
		add_attack_logs(user, src, "throw a maraca")
		investigate_log("[key_name(user)] triggered an explosion at [COORD(loc)]", INVESTIGATE_BOMB)
		explosion(loc, 1, 2, 4, flame_range = 2)
		qdel(src)

/obj/item/maracas/afterattack()
	chickchicky()

/obj/item/maracas/attack_self(mob/user as mob)
	chickchicky()

/obj/item/maracas/proc/chickchicky()
	var/turf/T = get_turf(src)
	if(T) // if our maracas explode, we won't be able to chickchicky because we'll have no turf
		playsound(T, 'sound/hispania/misc/maracas.ogg', 50, 1)
