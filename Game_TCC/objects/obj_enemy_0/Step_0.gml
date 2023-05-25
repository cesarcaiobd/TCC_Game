esquerda = /*1*/obj_player.x < x;
direita = /*1*/obj_player.x > x;
alcance_player = collision_line(x, y - sprite_height / 2, x + alcance * sign(velocidade_horizontal), y - sprite_height / 2, obj_player, 0, 1);

direcao = -esquerda + direita;

velocidade_horizontal = velocidade * direcao;

if (place_meeting(x + velocidade_horizontal, y - 1, obj_bloco)) {
	while (!place_meeting(x + sign(velocidade_horizontal), y - 1, obj_bloco)) {
		x += sign(velocidade_horizontal);
	}
	
	/*if (place_meeting(x + sign(velocidade_horizontal), y - 1, obj_bloco) && place_meeting(x, y + 1, obj_bloco)) {
		velocidade_vertical = -forca_do_pulo;
	}*/
	
	velocidade_horizontal = 0;
}

if (place_meeting(x, y + velocidade_vertical, obj_bloco)) {
	while (!place_meeting(x, y + sign(velocidade_vertical), obj_bloco)) {
		y += sign(velocidade_vertical);
	}
	
	velocidade_vertical = 0;
}
else {
	velocidade_vertical += gravidade * massa;
}

if (direcao != 0 && image_xscale != direcao) {
	image_xscale = -image_xscale;
}

switch (estado) {
	case "parado": {
		sprite_index = spr_esqueleto_2_idle;
		
		if (velocidade_horizontal != 0) {
			estado = "movendo";
		}
		
		if (foi_acertado) {
			if (vida > 0) {
				estado = "dano";
				image_index = 0;
				//foi_acertado = 0;
			}
			else {			
				estado = "morte";
				image_index = 0;
				//foi_acertado = 0;
			}
		}
		
		/*if (alcance_player) {
			estado = "atacando";
			image_index = 0;
		}*/
		
		break;
	}
	
	case "movendo": {
		sprite_index = spr_esqueleto_2_walk;
		
		if (velocidade_horizontal == 0) {
			estado = "parado";
		}
		
		if (foi_acertado) {
			if (vida > 0) {
				estado = "dano";
				image_index = 0;
				//foi_acertado = 0;
			}
			else {			
				estado = "morte";
				image_index = 0;
				//foi_acertado = 0;
			}
		}
		
		if (alcance_player) {
			estado = "atacando";
			image_index = 0;
		}
		
		break;
	}
	
	case "dano": {
		velocidade_horizontal = 0;
		sprite_index = spr_esqueleto_2_hit;
		
		if (image_index == image_number - 1) {
			estado = "parado";
		}
		
		foi_acertado = 0;
		
		break;
	}
	
	case "morte": {
		velocidade_horizontal = 0;
		sprite_index = spr_esqueleto_2_dead;
		
		if (image_index == image_number - 1) {
			//vida = 5;
			//estado = "parado";
			instance_destroy();
		}
		
		break;
	}
	
	case "atacando": {
		velocidade_horizontal = 0;
		sprite_index = spr_esqueleto_2_attack;
		
		if (image_index == image_number - 1) {
			estado = "parado";
		}
		
		/*if (image_index == 7 && dano == noone) {
			dano = instance_create_layer(x + sprite_width / 2, y - sprite_height / 2, layer, obj_dano);
			dano.dano = forca_do_ataque;
			dano.pai = id;
		}*/
		
		break;
	}
}

x += velocidade_horizontal;
y += velocidade_vertical;