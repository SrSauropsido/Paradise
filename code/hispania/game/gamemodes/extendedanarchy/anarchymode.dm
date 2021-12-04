/datum/game_mode/extended/anarchy
	name = "Extended Anarchy"
	config_tag = "extended-anarchy"
	required_players = 0

/datum/game_mode/announce()
	to_chat(world, "<BR><B>El modo de juego es Extended Anarchy!</B>")
	to_chat(world, "<B>En este modo de juego, <BIG>aplican menos reglas del server</BIG>, una experiencia menos intensiva de rol para más experimentación. Solo las reglas que están en el siguiente link aplican para esta partida <a href=\"https://hispaniastation.net/hispaniawiki/index.php/Anarchymode\">Reglas Anarchy</a></B>")
	to_chat(world, "<B>Ten en cuenta que las leyes IC siguen aplicando, si haces algo ilegal, seguridad aún podrá arrestarte</B>")

/datum/game_mode/extended/pre_setup()
	return 1

/datum/game_mode/extended/post_setup()
	..()
