/datum/game_mode/anarchy
	name = "Extended Anarchy"
	config_tag = "extended-anarchy"
	required_players = 0

/datum/game_mode/announce()
	to_chat(world, "<BR><B>El modo de juego es Extended Anarchy!</B>")
	to_chat(world, "<B>En este modo de juego, <BIG>APLICAN MENOS REGLAS QUE LO USUAL</BIG>, una experiencia menos intensiva de rol para m�s experimentaci�n. Solo las reglas que est�n en el siguiente link aplican para esta partida <a href=\"https://hispaniastation.net/hispaniawiki/index.php/Anarchymode\">Reglas Anarchy</a></B>")
	to_chat(world, "<B>Ten en cuenta que las leyes IC siguen aplicando, si haces algo ilegal, seguridad a�n podr� arrestarte</B>")

/datum/game_mode/anarchy/pre_setup()
	return 1

/datum/game_mode/anarchy/post_setup()
	..()
