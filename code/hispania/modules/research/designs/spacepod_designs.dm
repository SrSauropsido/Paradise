/datum/design/spacepod_main
	construction_time = 100
	name = "Circuit Design (Space Pod Mainboard)"
	desc = "Allows for the construction of a Space Pod mainboard."
	id = "spacepod_main"
	req_tech = list("materials" = 1) //All parts required to build a basic pod have materials 1, so the mechanic can do his damn job.
	build_type = PODFAB
	materials = list(MAT_METAL=5000)
	build_path = /obj/item/circuitboard/mecha/pod
	category = list("Pod_Parts")


//////////////////////////////////////////////////
/////////SPACEPOD PARTS///////////////////////////
//////////////////////////////////////////////////

/datum/design/podframe_fp
	construction_time = 200
	name = "Fore port pod frame"
	desc = "Allows for the construction of spacepod frames. This is the fore port component."
	id = "podframefp"
	build_type = PODFAB
	req_tech = list("materials" = 1)
	build_path = /obj/item/pod_parts/pod_frame/fore_port
	category = list("Pod_Frame")
	materials = list(MAT_METAL=15000,MAT_GLASS=5000)

/datum/design/podframe_ap
	construction_time = 200
	name = "Aft port pod frame"
	desc = "Allows for the construction of spacepod frames. This is the aft port component."
	id = "podframeap"
	build_type = PODFAB
	req_tech = list("materials" = 1)
	build_path = /obj/item/pod_parts/pod_frame/aft_port
	category = list("Pod_Frame")
	materials = list(MAT_METAL=15000,MAT_GLASS=5000)

/datum/design/podframe_fs
	construction_time = 200
	name = "Fore starboard pod frame"
	desc = "Allows for the construction of spacepod frames. This is the fore starboard component."
	id = "podframefs"
	build_type = PODFAB
	req_tech = list("materials" = 1)
	build_path = /obj/item/pod_parts/pod_frame/fore_starboard
	category = list("Pod_Frame")
	materials = list(MAT_METAL=15000,MAT_GLASS=5000)

/datum/design/podframe_as
	construction_time = 200
	name = "Aft starboard pod frame"
	desc = "Allows for the construction of spacepod frames. This is the aft starboard component."
	id = "podframeas"
	build_type = PODFAB
	req_tech = list("materials" = 1)
	build_path = /obj/item/pod_parts/pod_frame/aft_starboard
	category = list("Pod_Frame")
	materials = list(MAT_METAL=15000,MAT_GLASS=5000)

//////////////////////////
////////POD CORE////////
//////////////////////////

/datum/design/pod_core
	construction_time = 700 //Pod core should take a bit to process, after all, it's a big complicated engine and stuff.
	name = "Spacepod Core"
	desc = "Allows for the construction of a spacepod core system, made up of the engine and life support systems."
	id = "podcore"
	build_type = MECHFAB | PODFAB
	req_tech = list("materials" = 1)
	build_path = /obj/item/pod_parts/core
	category = list("Pod_Parts")
	materials = list(MAT_METAL=5000,MAT_URANIUM=1000,MAT_PLASMA=5000)

//////////////////////////////////////////
////////SPACEPOD ARMOR////////////////////
//////////////////////////////////////////

/datum/design/pod_armor_civ
	construction_time = 400 //more time than frames, less than pod core
	name = "Pod Armor (civilian)"
	desc = "Allows for the construction of spacepod armor. This is the civilian version."
	id = "podarmor_civ"
	build_type = PODFAB
	req_tech = list("materials" = 1)
	build_path = /obj/item/pod_parts/armor
	category = list("Pod_Armor")
	materials = list(MAT_METAL=15000,MAT_GLASS=5000,MAT_PLASMA=10000)

//////////////////////////////////////////
//////SPACEPOD GUNS///////////////////////
//////////////////////////////////////////

/datum/design/pod_gun_taser
	construction_time = 200
	name = "Spacepod Equipment (Taser)"
	desc = "Allows for the construction of a spacepod mounted taser."
	id = "podgun_taser"
	build_type = PODFAB
	req_tech = list("materials" = 2, "combat" = 2)
	build_path = /obj/item/spacepod_equipment/weaponry/taser
	category = list("Pod_Weaponry")
	materials = list(MAT_METAL = 15000)
	locked = 1

/datum/design/pod_gun_btaser
	construction_time = 200
	name = "Spacepod Equipment (Burst Taser)"
	desc = "Allows for the construction of a spacepod mounted taser. This is the burst-fire model."
	id = "podgun_btaser"
	build_type = PODFAB
	req_tech = list("materials" = 3, "combat" = 3)
	build_path = /obj/item/spacepod_equipment/weaponry/burst_taser
	category = list("Pod_Weaponry")
	materials = list(MAT_METAL = 15000,MAT_PLASMA=2000)
	locked = 1

/datum/design/pod_gun_laser
	construction_time = 200
	name = "Spacepod Equipment (Laser)"
	desc = "Allows for the construction of a spacepod mounted laser."
	id = "podgun_laser"
	build_type = PODFAB
	req_tech = list("materials" = 3, "combat" = 3, "plasmatech" = 2)
	build_path = /obj/item/spacepod_equipment/weaponry/laser
	category = list("Pod_Weaponry")
	materials = list(MAT_METAL=10000,MAT_GLASS=5000,MAT_GOLD=1000,MAT_SILVER=2000)
	locked = 1

/datum/design/pod_mining_laser_basic
	construction_time = 200
	name = "Basic Mining Laser"
	desc = "Allows for the construction of a weak mining laser"
	id = "pod_mining_laser_basic"
	req_tech = list("materials" = 3, "powerstorage" = 2, "engineering" = 2, "magnets" = 3, "combat" = 2)
	build_type = PODFAB
	materials = list(MAT_METAL = 10000, MAT_GLASS = 5000, MAT_SILVER = 2000, MAT_URANIUM = 2000)
	build_path = /obj/item/spacepod_equipment/weaponry/mining_laser_basic
	category = list("Pod_Weaponry")

/datum/design/pod_mining_laser
	construction_time = 200
	name = "Mining Laser"
	desc = "Allows for the construction of a mining laser."
	id = "pod_mining_laser"
	req_tech = list("materials" = 6, "powerstorage" = 6, "engineering" = 5, "magnets" = 6, "combat" = 4)
	build_type = PODFAB
	materials = list(MAT_METAL = 10000, MAT_GLASS = 5000, MAT_SILVER = 2000, MAT_GOLD = 2000, MAT_DIAMOND = 2000)
	build_path = /obj/item/spacepod_equipment/weaponry/mining_laser
	category = list("Pod_Weaponry")

/datum/design/pod_plasmacutterpod
	construction_time = 200
	name = "Plasma Cutter System"
	desc = "Allows for the construction of a plasma cutter system for dual fire."
	id = "pod_plasmacutterpod"
	req_tech = list("engineering" = 4, "materials" = 5, "plasmatech" = 4)
	build_type = PODFAB
	materials = list(MAT_METAL = 10000, MAT_GLASS = 2000, MAT_PLASMA = 6000)
	build_path = /obj/item/spacepod_equipment/weaponry/plasmacutterpod
	category = list("Pod_Weaponry")

/datum/design/pod_inmolationpod
	construction_time = 200
	name = "ZFI Immolation Beam System (Fire-Laser)"
	desc = "Allows for the construction of a spacepod mounted ZFI Immolation Beam System."
	id = "pod_inmolationpod"
	build_type = PODFAB
	req_tech = list("combat" = 6, "magnets" = 5, "materials" = 5)
	build_path = /obj/item/spacepod_equipment/weaponry/inmolationpod
	category = list("Pod_Weaponry")
	materials = list(MAT_METAL = 10000, MAT_SILVER = 8000, MAT_PLASMA = 8000)
	locked = TRUE

/datum/design/pod_ionsystempod
	construction_time = 200
	name = "Ion Breach System"
	desc = "Allows for the construction of a spacepod mounted Ion Breach System."
	id = "pod_ionsystempod"
	build_type = PODFAB
	req_tech = list("combat" = 6, "magnets" = 5, "materials" = 5, "engineering" = 4)
	build_path = /obj/item/spacepod_equipment/weaponry/ionsystempod
	category = list("Pod_Weaponry")
	materials = list(MAT_METAL=20000,MAT_SILVER=6000,MAT_URANIUM=2000)
	locked = TRUE

/datum/design/lmgpod
	construction_time = 200
	name = "LMG System"
	desc = "Allows for the construction of a spacepod mounted LMG System."
	id = "pod_lmgsystempod"
	build_type = PODFAB
	req_tech = list("combat" = 7)
	build_path = /obj/item/spacepod_equipment/weaponry/lmgpod
	category = list("Pod_Weaponry")
	materials = list(MAT_METAL=10000)
	locked = TRUE

/datum/design/pod_gun_blaser
	construction_time = 200
	name = "Spacepod Equipment (Burst Laser)"
	desc = "Allows for the construction of a spacepod mounted laser. This is the burst-fire model."
	id = "podgun_blaser"
	build_type = PODFAB
	req_tech = list("materials" = 4, "combat" = 4)
	build_path = /obj/item/spacepod_equipment/weaponry/burst_laser
	category = list("Pod_Weaponry")
	materials = list(MAT_METAL = 17500,MAT_PLASMA=3000)
	locked = 1

//////////////////////////////////////////
//////SPACEPOD MISC. ITEMS////////////////
//////////////////////////////////////////

/datum/design/pod_misc_tracker
	construction_time = 100
	name = "Spacepod Tracking Module"
	desc = "Allows for the construction of a Space Pod Tracking Module."
	id = "podmisc_tracker"
	req_tech = list("materials" = 2) //Materials 2: easy to get, no trackers with 0 science progress
	build_type = PODFAB
	materials = list(MAT_METAL=5000)
	build_path = /obj/item/spacepod_equipment/misc/tracker
	category = list("Pod_Parts")

/datum/design/paintkit
	construction_time = 100
	name = "Spacepod Paintkit Bucket"
	desc = "A bucket full with paint for your spacepod."
	id = "spacepodpaintkit"
	req_tech = list("materials" = 1, "combat" = 1, "engineering" = 1)
	build_type = PODFAB
	materials = list(MAT_METAL=5000)
	build_path = /obj/item/pod_paint_bucket
	category = list("Pod_Parts")

/datum/design/reinforced_plates_spacepod
	construction_time = 100
	name = "Spacepod Reinforced Engine"
	desc = "A bunch of plates that can be install near the engine to make it more robust but slower."
	id = "pod_plates_spacepod"
	req_tech = list("materials" = 5, "combat" = 4, "engineering" = 4)
	build_type = PODFAB
	materials = list(MAT_METAL=5000, MAT_SILVER = 2000)
	build_path = /obj/item/fluff/plates_spacepod
	category = list("Pod_Parts")

/datum/design/modified_engine
	construction_time = 100
	name = "Spacepod Modified Engine"
	desc = "A bunch of diagrams on how to make it faster but more easy to break."
	id = "pod_enginelight_spacepod"
	req_tech = list("materials" = 5, "combat" = 4, "engineering" = 4)
	build_type = PODFAB
	materials = list(MAT_METAL=5000, MAT_SILVER = 2000, ,MAT_BLUESPACE = 1000)
	build_path = /obj/item/fluff/plates_spacepod/velocity
	category = list("Pod_Parts")

/datum/design/basic_engine
	construction_time = 100
	name = "Spacepod Standard Engine"
	desc = "A bunch of diagrams on how to revert any changes to your engine."
	id = "pod_standard_spacepod"
	req_tech = list("materials" = 5, "combat" = 4, "engineering" = 4)
	build_type = PODFAB
	materials = list(MAT_METAL=5000)
	build_path = /obj/item/fluff/plates_spacepod/basic_engine
	category = list("Pod_Parts")

//////////////////////////////////////////
//////SPACEPOD CARGO ITEMS////////////////
//////////////////////////////////////////

/datum/design/pod_cargo_ore
	construction_time = 100
	name = "Spacepod Ore Storage Module"
	desc = "Allows for the construction of a Space Pod Ore Storage Module."
	id = "podcargo_ore"
	req_tech = list("materials" = 3, "engineering" = 2)
	build_type = PODFAB
	materials = list(MAT_METAL=20000, MAT_GLASS=2000)
	build_path = /obj/item/spacepod_equipment/cargo/ore
	category = list("Pod_Cargo")

/datum/design/pod_cargo_crate
	construction_time = 100
	name = "Spacepod Crate Storage Module"
	desc = "Allows the construction of a Space Pod Crate Storage Module."
	id = "podcargo_crate"
	req_tech = list("materials" = 4, "engineering" = 2) //hollowing out this much of the pod without compromising structural integrity is hard
	build_type = PODFAB
	materials = list(MAT_METAL=25000)
	build_path = /obj/item/spacepod_equipment/cargo/crate
	category = list("Pod_Cargo")

/datum/design/pod_chair_triple
	construction_time = 100
	name = "Spacepod Dual Passenger Seat"
	desc = "Allows the construction of a Space Pod Passenger Seat Module for Two more people."
	id = "pod_chair_triple"
	req_tech = list("materials" = 5, "engineering" = 4)
	build_type = PODFAB
	materials = list(MAT_METAL=20000, MAT_GLASS=2000)
	build_path = /obj/item/spacepod_equipment/sec_cargo/chair_triple
	category = list("Pod_Cargo")

/datum/design/chair_cuadro
	construction_time = 100
	name = "Spacepod Triple Passenger Seat"
	desc = "Allows the construction of a Space Pod Passenger Seat Module for Three more people."
	id = "chair_cuadro"
	req_tech = list("materials" = 7, "engineering" = 4)
	build_type = PODFAB
	materials = list(MAT_METAL=20000, MAT_GLASS=2000)
	build_path = /obj/item/spacepod_equipment/sec_cargo/chair_cuadro
	category = list("Pod_Cargo")

//////////////////////////////////////////
//////SPACEPOD SEC CARGO ITEMS////////////
//////////////////////////////////////////

/datum/design/passenger_seat
	construction_time = 100
	name = "Spacepod Passenger Seat"
	desc = "Allows the construction of a Space Pod Passenger Seat Module."
	id = "podcargo_sec_seat"
	req_tech = list("materials" = 1) // Because rule number one of refactoring
	build_type = PODFAB
	materials = list(MAT_METAL=7500, MAT_GLASS=2500)
	build_path = /obj/item/spacepod_equipment/sec_cargo/chair
	category = list("Pod_Cargo")

/datum/design/loot_box
	construction_time = 100
	name = "Spacepod Loot Storage Module"
	desc = "Allows the construction of a Space Pod Auxillary Cargo Module."
	id = "podcargo_sec_lootbox"
	req_tech = list("materials" = 1) //it's just a set of shelves, It's not that hard to make
	build_type = PODFAB
	materials = list(MAT_METAL=7500, MAT_GLASS=2500)
	build_path = /obj/item/spacepod_equipment/sec_cargo/loot_box
	category = list("Pod_Cargo")

/datum/design/bs_loot_box
	construction_time = 100
	name = "Spacepod Loot Storage Module Bluespace Version"
	desc = "Allows the construction of a Space Pod Auxillary Cargo Module Bluespace Version."
	id = "bs_loot_box"
	req_tech = list("bluespace" = 7, "magnets" = 6) //it's just a set of shelves, It's not that hard to make
	build_type = PODFAB
	materials = list(MAT_METAL=10000,MAT_GLASS=5000,MAT_GOLD=1000,MAT_SILVER=2000,MAT_BLUESPACE = 1000)
	build_path = /obj/item/spacepod_equipment/sec_cargo/bs_loot_box
	category = list("Pod_Cargo")

//////////////////////////////////////////
//////SPACEPOD LOCK ITEMS////////////////
//////////////////////////////////////////

/datum/design/pod_lock_keyed
	construction_time = 100
	name = "Spacepod Tumbler Lock"
	desc = "Allows for the construction of a tumbler style podlock."
	id = "podlock_keyed"
	req_tech = list("materials" = 1) //The most basic kind of locking system
	build_type = PODFAB
	materials = list(MAT_METAL=4500)
	build_path = /obj/item/spacepod_equipment/lock/keyed
	category = list("Pod_Parts")

/datum/design/pod_key
	construction_time = 100
	name = "Spacepod Tumbler Lock Key"
	desc = "Allows for the construction of a blank key for a podlock."
	id = "podkey"
	req_tech = list("materials" = 1) //The most basic kind of locking system
	build_type = PODFAB
	materials = list(MAT_METAL=500)
	build_path = /obj/item/spacepod_key
	category = list("Pod_Parts")
