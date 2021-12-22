/obj/machinery/computer/rdconsole
	var/secureprotocols = TRUE	//si esta activo las cajas con req acces salen boqueadas por defecto

/obj/machinery/computer/rdconsole/power_change()
	..()
	if(!powered(power_channel))
		qdel(files)
		files = new /datum/research(src)

/obj/machinery/computer/rdconsole/mechanics
	name = "mechanics R&D console"
	desc = "A console used to interface with R&D tools."
	id = 4
	req_access = list(ACCESS_MECHANIC)
	circuit = /obj/item/circuitboard/rdconsole/mechanics
