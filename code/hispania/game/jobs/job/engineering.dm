/datum/job/mechanic
	title = "Mechanic"
	flag = JOB_MECHANIC
	department_flag = JOBCAT_KARMA
	total_positions = 1
	spawn_positions = 1
	is_engineering = 1
	supervisors = "the chief engineer"
	department_head = list("Chief Engineer")
	selection_color = "#fff5cc"
	access = list(ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS, ACCESS_MECHANIC, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_EMERGENCY_STORAGE, ACCESS_MECHANIC, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_MINERAL_STOREROOM)
	outfit = /datum/outfit/job/mechanic

/datum/outfit/job/mechanic
	name = "Mechanic"
	jobtype = /datum/job/mechanic

	uniform = /obj/item/clothing/under/rank/mechanic
	belt = /obj/item/storage/belt/utility/full
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat
	l_ear = /obj/item/radio/headset/headset_eng
	id = /obj/item/card/id/engineering
	r_pocket = /obj/item/t_scanner
	pda = /obj/item/pda/engineering
	backpack_contents = list(
		/obj/item/pod_paint_bucket = 1
	)

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel_eng
	dufflebag = /obj/item/storage/backpack/duffel/engineering
	box = /obj/item/storage/box/engineer
