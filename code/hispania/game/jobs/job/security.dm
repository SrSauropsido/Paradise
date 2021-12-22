/datum/job/pilot
	title = "Security Pod Pilot"
	flag = JOB_PILOT
	department_flag = JOBCAT_KARMA
	total_positions = 1
	spawn_positions = 1
	is_security = 1
	supervisors = "the head of security"
	department_head = list("Head of Security")
	selection_color = "#ffeeee"
	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_PILOT, ACCESS_EXTERNAL_AIRLOCKS)
	minimal_access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_WEAPONS, ACCESS_PILOT, ACCESS_EXTERNAL_AIRLOCKS)
	minimal_player_age = 7
	outfit = /datum/outfit/job/pilot

/datum/outfit/job/pilot
	name = "Security Pod Pilot"
	jobtype = /datum/job/pilot
	uniform = /obj/item/clothing/under/rank/security/pod_pilot
	suit = /obj/item/clothing/suit/jacket/pilot
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/jackboots
	l_ear = /obj/item/radio/headset/headset_sec/alt
	id = /obj/item/card/id/security
	l_pocket = /obj/item/flash
	suit_store = /obj/item/gun/energy/gun/advtaser
	pda = /obj/item/pda/security
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1
	)
	implants = list(/obj/item/implant/mindshield)
	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel_sec
	dufflebag = /obj/item/storage/backpack/duffel/security
	box = /obj/item/storage/box/engineer
