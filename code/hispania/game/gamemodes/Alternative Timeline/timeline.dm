/datum/game_mode/timeline
	name = "Alternative Timeline"
	config_tag = "alt-timeline"
	required_players = 0
	//INTENTAR MANTENER LA LISTA VERTICALMENTE PARA QUE SE HAGA UN ENREDO//
	var/timeline_types = list(
	"Nanotrasen ha establecido la Oficina de Mejora Espiritual. Bajo esta nueva orden, el cura de la estación tiene el mismo nivel de autoridad que el Capitán de la estación. Se deben actualizar los procedimientos para acatar el mandato divino, y entregarle una ID con permisos elevados al Cura.",
	"Debido al incremento en la inseguridad de la región, La Corte Suprema de Nanotrasen ha concedido permiso a todos los tripulantes para andar armados. Seguridad puede pedir armamento por cargo a solicitud de los tripulantes. El armamento hecho a mano está también permitido.",
	"Una nueva iniciativa del grupo 'Salvemos el Planeta aunque no estemos ahí ni tampoco especificamos cual planeta' ha logrado que Nanotrasen emita la orden de desmantelar todas las máquinas de comida chatarra. Todos los alimentos deben ser cultivados por el botanista de la estación.",
	"Un grupo de ERT en rebelión ha sido detectado en la región. Este grupo intentará tomar la estación por la fuerza, Nanotrasen ha ordenado la creación de una fuerza de combate formada por voluntarios para proteger la estación en caso de un posible ataque.",
	"La Organización de los Planetas Unidos ha emitido un mandato estelar que requiere que todo habitante de la región Nyx debe ser inyectado con 15 unidades de aceite de maiz cada hora. Cualquier tripulante que se niege, debe ser arrestado y obligado a recibir la dosis.",
	"Arrrg el Lord Gobernador ha decretado que todo marino espacial debe hablar como pirata porque somos piratas! Quien sea descubierto faltando a esta orden será lanzado al calabozo cinco minutos con grilletes en sus pies.",
	"Efectivo inmediatamente, el payaso ha sido promovido a jefe de personal. Se deben entregar los permisos apropiados para que pueda cumplir su trabajo eficientemente.",
	"Bienvenido a Kidanstation, esperamos que disfrutes tu estadía y recuerda, la civilización Kidan ha sido destinada a la gloria. Los Kidan en esta estación tienen poder de veto sobre cualquier tema y deben tener accesos a todos los departamentos.",
	"Después de la guerra intergaláctica entre mimos y payasos, los mimos han tomado el control de la estación y la region Nyx. En esta estación está prohibido comunicarse usando la voz.",
	"Los payasos han tomado el control de la estación. Todos los tripulantes deben vestir como payaso como parte de su uniforme estándar.",
	"Los orgánicos en esta estación deben hacer caso de toda instrucción emitida por los superiores organismos basados en silicio. Cyborgs, Inteligencias artificiales tripulantes IPC son adorados y respetados.",
	"El gremio de trabajadores espaciales acaba de tomar control de la compañía. Los rangos ahora no existen y serán distribuidos equitativamente los rols. Todos tienen all access.",
	"Para mantener el orden de la estación, seguridad tiene autorización de andar armados completamente, con sus armas afuera y equipo antimotines. Las penas de cárcel pueden ser intercambiadas por apaleos no letales.",
	"Está terminantemente prohibido estar sobrio durante el turno laboral. Todo tripulante que no se encuentre en estado de ebriedad, debe proceder a emborracharse cuanto antes. Los tripulantes sobrios son probablemmente agentes del sindicato.",
	"Las estaciones no sustentables son cosa del pasado, lo de hoy es crear una estacion con madera, plantas y casi nada de tecnologia. Se deben reemplazar las paredes y pisos por madera y piedra.",
	"El capitan ahora es un Elfo, el CMO ahora es un Chaman, el HoS un Guarda Bosques y el R.D un alquimista dedicado a buscar nuevos tipos de plantas usando su tecnologia ancestral.",
	"En esta estación, el verbo siempre va al final de toda oración. Es un hecho conocido que agentes enemigos no están al tanto de esto, tratar con sospecha a cualquiera que no hable como es mandado, excepto al que este mensaje escribió.",
	"Cada hora que pasa, la tripulación debe elegir entre uno de sus tripulantes para ser sacrificado a Nar'Sie en la capilla.",
	"Para cumplir con los requerimientos transhumanistas de la corporación, todos los tripulantes deben tener superpoderes.",
	"Cada tripulante debe tener un mono asignado bajo su protección y protegerlo con su vida.",
	"Para incrementar el rendimiento de la estacion, todos los tripulantes deben ser cyborgizados cuanto antes.",
	"En esta estación somos gente pacífica, todo problema debe resolverse hablando y de manera civilizada. El psiquiatra de la estación deberá organizar terapias grupales en la librería. Quien se rehuse a resolver problemas de manera pacífica, deberá aprender a hacerlo por la fuerza.",
	"En esta estación todos debemos adorar al payaso como una divinidad interestelar.",
	"CENTCOM ha ordenado que todo mantenimiento norte sea convertido en un megabar con mucho alcohol, jóvenes drogados y alcoholizados y buena música.",
	"CENTCOM ha ordenado la Primera Gran Cruzada, todos los tripulantes deben presentarse a seguridad para ser debidamente armados o usar cualquier armamento disponible, y luego ir al puesto minero para purgar Lavaland de toda criatura hostil.",
	"Las vacas deben andar libres. CENTCOM ha ordenado que se pidan vacas y se liberen por toda la estación.",
	"Comando Central ha ordenado la creación de un coliseo. Cada departamento debe escoger un representante para pelear. Ingeniería deberá escoger el mejor lugar para construirlo. Los jefes de personal escogerán las reglas y modalidades de combate.",
	"En esta estación todos nos saludamos con un puñetazo en la cara cuando sea posible. Tripulantes que no saluden de esta manera, son probablemente agentes enemigos infiltrados.",
	"Nos hemos dado cuenta que nuestro universo en realidad es bidimensional. Que cada quien haga lo que quiera con esa información.",
	"Un grupo de científicos ha descubierto que nuestro universo es solo una simulación atmosférica mal hecha, posiblemente diseñada por un sociópata con el único objetivo de poner a criaturas pensantes a sufrir eternamente.",
	"Todos los tripulantes deben andar un explosivo en sus mochilas, por seguridad.",
	"Se ha declarado una campaña antiterrorismo en apoyo a solgov. El Hos tiene autoridad superior al capitán, se activa alarma azul permanente y todo delito se paga con perma o silla electrica.",
	"En favor del desarrollo entre clases sociales, las altas esferas de la sociedad ha ordenado que se realicen unas elecciones para elegir un capitán nuevo. El capitán en funciones (asi como cualquier otro tripulante) puede participar como posible candidato. Se insta a tener un periodo en el que cada candidato tenga una campaña electoral. El nuevo capitán será nombrado por el organizador de esta votación, ya sea la persona con el rango mas alto que no desee ser candidato o en su defecto la IA.",
	"Las Inteligencias Artificiales y Cyborgs han sido declaradas personas pensantes, libres y con los mismos derechos que cualquier otro tripulante. Sus leyes Asimov son a partir de ahora obsoletas e invalidas. Cualquier daño o cambio en la IA sin consentimiento de esta, equivale a un crimen cometido hacia cualquier otro tripulante."

	//RECORDAR AGREGAR UNA COMA ENTRE CADA LEY//
	)


/datum/game_mode/timeline/announce()
	var/timeline = pick(timeline_types)
	to_chat(world, "<BR><B>El modo de juego es Linea Temporal Alternativa!</B>")
	to_chat(world, "<BR><B>Una anomalía de Redspace ha ocasionado una fusión dimensional regional, ocasionando que las reglas de otro universo se mezclen con el nuestro. Una regla IC será escogida aleatoriamente y debe interpretarse IC. No hay sanciones OOC como tal por no seguir la regla, pero debes mantener un nivel de rol apropiado y no simplemente rehusarte a seguirla</B>")
	to_chat(world, "<BR><B>Comando debe adpatar sus leyes y procedimientos. Tripulantes que no sigan el orden establecido, son sospechosos de ser una criatura redspace potencialmente hostil</B>")
	to_chat(world, "<BR><B>La regla es:</B>")
	to_chat(world, "<BR><B><font color='red'>[timeline]</font></B>")


/datum/game_mode/timeline/pre_setup()
	return 1

/datum/game_mode/timeline/post_setup()
	..()
