/datum/reagent/lean
	name = "Lean"
	id = "lean"
	description = "Highly addictive and relaxing combination of lemon lime and hydrocodone with plasma. I LOVE LEAAAAAAAN"
	reagent_state = LIQUID
	color = "#8C00D8"
	metabolization_rate = 0.3
	overdose_threshold = 30
	process_flags = ORGANIC
	addiction_chance = 1
	addiction_chance_additional = 20
	addiction_threshold = 20
	shock_reduction = 100
	taste_description = "soda and cough syrup"

/datum/reagent/lean/on_mob_life(mob/living/M)
	var/update_flags = STATUS_UPDATE_NONE
	update_flags |= M.Druggy(15, FALSE)
	M.AdjustHallucinate(10)
	return ..() | update_flags

/datum/reagent/lean/overdose_process(mob/living/M, severity)
	var/list/overdose_info = ..()
	var/effect = overdose_info[REAGENT_OVERDOSE_EFFECT]
	var/update_flags = overdose_info[REAGENT_OVERDOSE_FLAGS]
	if(severity == 1)
		if(effect <= 2)
			M.visible_message("<span class='warning'>[M] can't seem to control [M.p_their()] legs!</span>")
			M.AdjustConfused(33)
			update_flags |= M.Weaken(2, FALSE)
		else if(effect <= 4)
			M.visible_message("<span class='warning'>[M]'s hands relax entirely!</span>")
			M.drop_l_hand()
			M.drop_r_hand()
		else if(effect <= 7)
			M.emote("laugh")
	else if(severity == 2)
		if(effect <= 2)
			M.visible_message("<span class='warning'>[M]'s relaxes entirely!</span>")
			M.drop_l_hand()
			M.drop_r_hand()
		else if(effect <= 4)
			M.visible_message("<span class='warning'>[M] falls to the floor and flails uncontrollably!</span>")
			M.Jitter(5)
			update_flags |= M.Weaken(5, FALSE)
	return list(effect, update_flags)
