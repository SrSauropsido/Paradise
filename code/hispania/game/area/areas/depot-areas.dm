/area/syndicate_depot/core/proc/saw_pod(obj/spacepod/P)
	if(detected_pod)
		return
	detected_pod = TRUE
	if(!called_backup)
		increase_alert("Hostile spacepod detected: [P]")
