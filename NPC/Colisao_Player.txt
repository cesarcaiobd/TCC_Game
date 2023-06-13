switch (room) {
	case Fase1: {
		if (keyboard_check_pressed(ord("E")) && other.chaves == 1) {
			room_goto(Fase2);
		}
		
		break;
	}
	
	case Fase2: {
		if (keyboard_check_pressed(ord("E")) && other.chaves == 3) {
			room_goto(Fase3);
		}
		
		break
	}
}