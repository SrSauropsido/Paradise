/obj/machinery/mecha_part_fabricator
	var/secureprotocols = TRUE	//para que los diseños bloqueados salgan bloqueados

/obj/machinery/mecha_part_fabricator/emag_act(mob/user)
	if(!emagged)
		playsound(src.loc, 'sound/effects/sparks4.ogg', 75, 1)
		req_access = list()
		emagged = TRUE
		secureprotocols = FALSE
		to_chat(user, "<span class='notice'>You disable the security protocols</span>")
		..()
/**
  * # Spacepod Fabricator
  *
  * Spacepod variant of [/obj/machinery/mecha_part_fabricator].
  */
/obj/machinery/mecha_part_fabricator/spacepod
	name = "spacepod fabricator"
	allowed_design_types = PODFAB
	req_access = list(ACCESS_MECHANIC)

/obj/machinery/mecha_part_fabricator/spacepod/New()
	..()
	QDEL_LIST(component_parts)
	component_parts = list()
	component_parts += new /obj/item/circuitboard/podfab(null)
	component_parts += new /obj/item/stock_parts/matter_bin(null)
	component_parts += new /obj/item/stock_parts/matter_bin(null)
	component_parts += new /obj/item/stock_parts/manipulator(null)
	component_parts += new /obj/item/stock_parts/micro_laser(null)
	component_parts += new /obj/item/stack/sheet/glass(null)
	RefreshParts()

/obj/machinery/mecha_part_fabricator/spacepod/Initialize(mapload)
	. = ..()
	categories = list(
		"Pod_Weaponry",
		"Pod_Armor",
		"Pod_Cargo",
		"Pod_Parts",
		"Pod_Frame",
		"Misc"
	)
