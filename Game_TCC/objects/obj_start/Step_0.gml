if (place_meeting(x, y, obj_mouse)) {
	image_index = 1;
}
else {
	image_index = 0;
}

if (mouse_check_button_pressed(mb_left)) {
	room_goto(Fase1);
}

if (mouse_check_button_pressed(mb_right)) {
	room_goto(Ambiente1);
}