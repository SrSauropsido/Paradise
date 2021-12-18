/datum/event/feedme
	announceWhen = 3


/datum/event/spawn_feedme/announce()
	GLOB.event_announcement.Announce("vino la criatura')


/datum/event/spawn_feedme/start()
	var/list/spawn_locs = list()
	new /mob/living/simple_animal/hostile/feedme(pick(GLOB.feedmespawn)
