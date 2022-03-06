/turf/simulated/floor/plasteel/hispania
	icon_state = "L1"
	icon = 'icons/hispania/turf/floors.dmi'
	floor_tile = /obj/item/stack/tile/plasteel
	broken_states = list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5")
	burnt_states = list("floorscorched1", "floorscorched2")

/turf/simulated/floor/plating/asteroid/snow/naga
	oxygen = 10
	nitrogen = 82
	floor_variance = 15
	temperature = 120
	icon = 'icons/hispania/turf/snow.dmi'
	baseturf = /turf/simulated/floor/plating/asteroid/snow/naga

/turf/simulated/floor/plating/ice_naga
	name = "ice sheet"
	desc = "A sheet of solid ice. Looks slippery."
	icon = 'icons/hispania/turf/ice_turfs.dmi'
	icon_state = "ice_turf-0"
	oxygen = 10
	nitrogen = 82
	temperature = 120
	baseturf = /turf/simulated/floor/plating/ice_naga

/turf/simulated/floor/plating/ice_naga/smooth
	icon_state = "ice_turf-255"
	base_icon_state = "ice_turf"
	smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER
	canSmoothWith = list(SMOOTH_GROUP_TURF, SMOOTH_GROUP_FLOOR_NAGA)
	smoothing_groups = list(SMOOTH_GROUP_FLOOR_NAGA)

/turf/simulated/floor/plating/ice_naga/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/simulated/floor/plating/ice_naga/Initialize(mapload)
	. = ..()
	MakeSlippery(TURF_WET_PERMAFROST, INFINITY)
