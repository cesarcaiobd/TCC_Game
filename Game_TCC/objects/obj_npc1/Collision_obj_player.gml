switch (room) {
	case Fase1: {
		if (keyboard_check_pressed(ord("E")) && other.chaves == 1) {
			global.backup_forca_do_ataque = other.forca_do_ataque;
			room_goto(Fase2);
		}
		
		break;
	}
	
	case Fase2: {
		if (keyboard_check_pressed(ord("E")) && other.chaves == 3) {
			global.backup_forca_do_ataque = other.forca_do_ataque;
			room_goto(Fase3);
		}
		
		break;
	}
}