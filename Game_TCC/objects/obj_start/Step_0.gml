if (obj_escolha_skeleton_player.sprite_index == obj_escolha_skeleton_player.animacao_correndo) {
	escolha = "A";
}

if (obj_escolha_skeleton_spear_player.sprite_index == obj_escolha_skeleton_spear_player.animacao_correndo) {
	escolha = "B";
}


if (place_meeting(x, y, obj_mouse) && escolha == "A" || place_meeting(x, y, obj_mouse) && escolha == "B") {
	image_index = 1;
	
	if (mouse_check_button_pressed(mb_left)) {	
		room_goto(Fase1);
	}

	if (mouse_check_button_pressed(mb_right)) {
		room_goto(Ambiente1);
	}
}
else {
	image_index = 0;
}