//microscope code itself

/obj/machinery/microscope
	name = "Microscopio electronico"
	desc = "Microscopio de alta tecnologia capaz de ampliar imagenes hasta 3000 veces."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "microscope"
	anchored = 1
	density = 1
	var/obj/item/sample = null
	var/report_num = 0
	var/operating = 0

//This is the output of the stringpercent(print) proc, and means about 80% of
//the print must be there for it to be complete.  (Prints are 32 digits)
/obj/machinery/microscope/proc/is_complete_print(print)
	return stringpercent(print) <= 6

/obj/machinery/microscope/Initialize(mapload)
	. = ..()
	component_parts = list()
	component_parts += new /obj/item/circuitboard/microscope(null)
	component_parts += new /obj/item/stock_parts/micro_laser(null)
	component_parts += new /obj/item/stack/sheet/glass(null)

/obj/machinery/microscope/attackby(obj/item/W as obj, mob/user as mob)
	if(sample)
		to_chat(user, "<span class='warning'>¡Ya hay una muestra en el microscopio!</span>")
		return
	if(istype(W, /obj/item/forensics/swab)|| istype(W, /obj/item/sample/fibers) || istype(W, /obj/item/sample/print))
		to_chat(user, "<span class='notice'>Insertaste \the [W] en el microscopio</span>")
		playsound(loc, 'sound/hispania/machines/Custom_screwdriverclose.ogg', 50, 1)
		user.unEquip(W)
		W.forceMove(src)
		sample = W
		update_icon()
		return
	..()

/obj/machinery/microscope/attack_hand(mob/user)
	if(operating == 1)
		return
	if(!sample)
		to_chat(user, "<span class='warning'>No hay muestra en el microscopio para analizar.</span>")
		return
	to_chat(user, "<span class='notice'>El microscopio vibra mientras analizas \the [sample].</span>")
	operating = 1
	if(!do_after(user, 25, src) || !sample)
		to_chat(user, "<span class='notice'>Dejas de analizar \the [sample].</span>")
		operating = 0
		return
	to_chat(user, "<span class='notice'>Imprimiendo reporte..</span>")
	var/obj/item/paper/report = new(get_turf(src))
	report.stamped = list(/obj/item/stamp)
	report.overlays = list("paper_stamped")
	report_num++
	if(istype(sample, /obj/item/forensics/swab))
		var/obj/item/forensics/swab/swab = sample
		report.name = ("Informe forense №[++report_num]: [swab.name]")
		report.info = "<b>Objeto analizado:</b><br>[swab.name]<br><br>"
		if(swab.gsr)
			report.info += "Resto de bala determinado [swab.gsr] calibre."
		else
			report.info += "No se encontraron residuos de bala."
	else if(istype(sample, /obj/item/sample/fibers))
		var/obj/item/sample/fibers/fibers = sample
		report.name = ("Informe de fragmentos №[++report_num]: [fibers.name]")
		report.info = "<b>Objeto analizado:</b><br>[fibers.name]<br><br>"
		if(fibers.evidence)
			report.info = "El analisis molecular de la muestra proporcionada identifico la presencia de hilos de fibra unicos.<br><br>"
			for(var/fiber in fibers.evidence)
				report.info += "<span class='notice'>Coincidencia mas probable: [fiber]</span><br><br>"
		else
			report.info += "No se encontraron fibras."
	else if(istype(sample, /obj/item/sample/print))
		report.name = ("Informe de analisis de huellas dactilares numero: [report_num]: [sample.name]")
		report.info = "<b>Informe de analisis de huellas dactilares numero: [report_num]</b>: [sample.name]<br>"
		var/obj/item/sample/print/card = sample
		if(card.evidence && card.evidence.len)
			report.info += "<br>El analisis de superficie identifico las siguientes lineas unicas de huellas dactilares:<br><br>"
			for(var/prints in card.evidence)
				report.info += "<span class='notice'>Cadena de huellas dactilares: </span>"
				if(!is_complete_print(prints))
					report.info += "IMPRESIÓN INCOMPLETA"
				else
					report.info += "[prints]"
					playsound(loc, 'sound/hispania/machines/floppydisk.ogg', 50, 1)
				report.info += "<br>"
		else
			report.info += "No hay informacion de analisis disponible."
	if(report)
		report.update_icon()
		if(report.info)
			to_chat(user, report.info)
	operating = 0
	return

/obj/machinery/microscope/proc/remove_sample(mob/living/remover)
	if(!istype(remover) || remover.incapacitated() || !Adjacent(remover))
		return
	if(!sample)
		to_chat(remover, "<span class='warning'>¡No hay muestra dentro del microscopio!</span>")
		return
	to_chat(remover, "<span class='notice'>Te sacaste \the [sample] de un microscopio.</span>")
	sample.forceMove(get_turf(src))
	remover.put_in_hands(sample)
	sample = null
	update_icon()

/obj/machinery/microscope/AltClick()
	remove_sample(usr)

/obj/machinery/microscope/MouseDrop(atom/other)
	if(usr == other)
		remove_sample(usr)
	else
		return

/obj/machinery/microscope/update_icon()
	icon_state = "microscope"
	if(sample)
		icon_state += "slide"

/obj/machinery/microscope/screwdriver_act(mob/user, obj/item/I)
	if(sample)
		return
	. = TRUE
	default_deconstruction_screwdriver(user, "microscope_off", "microscope", I)

/obj/machinery/microscope/wrench_act(mob/user, obj/item/I)
	. = TRUE
	default_unfasten_wrench(user, I)

/obj/machinery/microscope/verb/eject()
	set category = "Object"
	set name = "Eject Sample"
	set src in oview(1)
	if(usr.incapacitated())
		return
	remove_sample(usr)
	add_fingerprint(usr)

/obj/machinery/microscope/crowbar_act(mob/user, obj/item/I)
	if(sample)
		return
	. = TRUE
	default_deconstruction_crowbar(user, I)
