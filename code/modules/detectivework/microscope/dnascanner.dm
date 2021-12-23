//DNA machine
/obj/machinery/dnaforensics
	name = "Analizador de ADN"
	desc = "Maquina de alta tecnologia hecha para leer correctamente muestras de ADN."
	icon = 'icons/obj/forensics.dmi'
	icon_state = "dnaopen"
	layer = BELOW_OBJ_LAYER
	anchored = 1
	density = 1
	var/obj/item/forensics/swab = null
	var/scanning = 0
	var/report_num = 0
	var/operating = 0

/obj/machinery/dnaforensics/Initialize(mapload)
	. = ..()
	component_parts = list()
	component_parts += new /obj/item/circuitboard/dnaforensics(null)
	component_parts += new /obj/item/stock_parts/micro_laser(null)
	component_parts += new /obj/item/stock_parts/manipulator(null)
	component_parts += new /obj/item/stock_parts/micro_laser(null)

/obj/machinery/dnaforensics/attackby(obj/item/W as obj, mob/user as mob)
	if(swab)
		to_chat(user, "<span class='warning'>Ya hay un tubo dentro del escaner.</span>")
		return
	if(istype(W, /obj/item/forensics/swab))
		to_chat(user, "<span class='notice'>Insertaste \the [W] en el analizador de ADN.</span>")
		playsound(loc, 'sound/hispania/machines/Custom_screwdriverclose.ogg', 50, 1)
		user.unEquip(W)
		W.forceMove(src)
		swab = W
		update_icon()
		return
	..()

/obj/machinery/dnaforensics/attack_hand(mob/user)
	if(operating == 1)
		return
	if(!swab)
		to_chat(user, "<span class='warning'>¡El escaner esta vacio!</span>")
		return
	scanning = 1
	update_icon()
	to_chat(user, "<span class='notice'>El escaner comienza a analizar el contenido del tubo con un zumbido. \the [swab].</span>")
	operating = 1
	if(!do_after(user, 25, src) || !swab)
		to_chat(user, "<span class='notice'>Dejaste de analizar \the [swab].</span>")
		scanning = 0
		update_icon()
		operating = 0
		return
	to_chat(user, "<span class='notice'>Imprimiendo reporte ...</span>")
	playsound(loc, 'sound/goonstation/machines/printer_dotmatrix.ogg', 50, 1)
	var/obj/item/paper/report = new(get_turf(src))
	report.stamped = list(/obj/item/stamp)
	report.overlays = list("paper_stamped")
	report_num++
	if(swab)
		var/obj/item/forensics/swab/bloodswab = swab
		report.name = ("Informe del escaner de ADN N°[++report_num]: [bloodswab.name]")
		//dna data itself
		var/data = "No hay datos de analisis disponibles"
		if(bloodswab.dna != null)
			data = "El analisis espectrometrico de la muestra proporcionada determino la presencia de hebras de ADN en una cantidad de: [bloodswab.dna.len].<br><br>"
			for(var/blood in bloodswab.dna)
				data += "<span class='notice'>Tipo de sangre: [bloodswab.dna[blood]]<br>\n ADN: [blood]</span><br><br>"
		else
			data += "\nДНК не найдено.<br>"
		report.info = "<b>Reporte numero:[report_num] \n[src]</b><br>"
		report.info += "<b>\nObjeto analizado:</b><br>[bloodswab.name]<br>[bloodswab.desc]<br><br>" + data
		report.forceMove(src.loc)
		report.update_icon()
		scanning = 0
		update_icon()
	operating = 0
	return

/obj/machinery/dnaforensics/proc/remove_sample(mob/living/remover)
	if(!istype(remover) || remover.incapacitated() || !Adjacent(remover))
		return
	if(!swab)
		to_chat(remover, "<span class='warning'>¡No hay muestra dentro del escaner!.</span>")
		return
	to_chat(remover, "<span class='notice'Tiraste \the [swab] desde el escaner.</span>")
	swab.forceMove(get_turf(src))
	remover.put_in_hands(swab)
	swab = null
	update_icon()

/obj/machinery/dnaforensics/AltClick()
	remove_sample(usr)

/obj/machinery/dnaforensics/MouseDrop(atom/other)
	if(usr == other)
		remove_sample(usr)
	else
		return

/obj/machinery/dnaforensics/update_icon()
	icon_state = "dnaopen"
	if(swab)
		icon_state = "dnaclosed"
		if(scanning)
			icon_state = "dnaworking"

/obj/machinery/dnaforensics/screwdriver_act(mob/user, obj/item/I)
	if(swab)
		return
	. = TRUE
	default_deconstruction_screwdriver(user, "dnaopenunpowered", "dnaopen", I)

/obj/machinery/dnaforensics/wrench_act(mob/user, obj/item/I)
	. = TRUE
	default_unfasten_wrench(user, I)

/obj/machinery/dnaforensics/verb/eject()
	set category = "Object"
	set name = "Eject DNA"
	set src in oview(1)
	if(usr.incapacitated())
		return
	remove_sample(usr)
	add_fingerprint(usr)

/obj/machinery/dnaforensics/crowbar_act(mob/user, obj/item/I)
	if(swab)
		return
	. = TRUE
	default_deconstruction_crowbar(user, I)
