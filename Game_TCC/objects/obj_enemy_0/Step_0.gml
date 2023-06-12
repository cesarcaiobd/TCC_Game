esquerda = obj_player.x < x;
direita = obj_player.x > x;
alcance_player = collision_line(x, y - sprite_height / 3, x + alcance * sign(velocidade_horizontal), y - sprite_height / 3, obj_player, 0, 1);

direcao = -esquerda + direita;

velocidade_horizontal = velocidade * direcao;

if (place_meeting(x + velocidade_horizontal, y - 1, obj_bloco)) {
	while (!place_meeting(x + sign(velocidade_horizontal), y - 1, obj_bloco)) {
		x += sign(velocidade_horizontal);
	}
	
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
		
		break;
	}
	
	case "movendo": {
		sprite_index = spr_esqueleto_2_walk;
		
		if (velocidade_horizontal == 0) {
			estado = "parado";
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
		
		break;
	}
	
	case "morte": {
		velocidade_horizontal = 0;
		sprite_index = spr_esqueleto_2_dead;
		
		if (image_index == image_number - 1) {
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
		
		if (image_index == 7 && dano == noone) {
			dano = instance_create_layer(x + sprite_width / 2, y - sprite_height / 3, layer, obj_dano);
			dano.nome = nome;
			dano.dano = forca_do_ataque;
			dano.pai = id;
		}
		
		break;
	}
}

x += velocidade_horizontal;
y += velocidade_vertical;