if (!place_meeting(x, y, obj_mouse) && sprite_index == animacao_parado) {
	image_index = 0;
}
else {
	if (mouse_check_button_pressed(mb_left)) {
		sprite_index = animacao_correndo;
		obj_escolha_skeleton_spear_player.sprite_index = obj_escolha_skeleton_spear_player.animacao_parado;
		global.animacoes_player[0] = animacao_parado;
		global.animacoes_player[1] = animacao_correndo;
		global.animacoes_player[2] = animacao_ataque;
		global.animacoes_player[3] = animacao_dano;
		global.animacoes_player[4] = animacao_morte;
	}
}