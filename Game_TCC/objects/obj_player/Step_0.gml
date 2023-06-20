pulo = keyboard_check_pressed(ord("K"));
esquerda = keyboard_check(ord("A"));
direita = keyboard_check(ord("D"));
ataque = keyboard_check_pressed(ord("J"));
image_yscale = tamanho;
image_xscale = tamanho * sign(image_xscale);

/*if (mouse_check_button_pressed(mb_left)) {
	
}*/

/*if (place_meeting(x, y + velocidade_vertical, obj_bloco)) {
	while (!place_meeting(x, y + sign(velocidade_vertical), obj_bloco)) {
		y += sign(velocidade_vertical);
	}
	
	velocidade_vertical = 0;
	pulos = limite_de_pulo;
}
else {
	velocidade_vertical += gravidade * massa;
}*/

if (pulo && pulos > 0) {
	if (place_meeting(x, y + 1, obj_bloco) && pulos == limite_de_pulo || !place_meeting(x, y + 1, obj_bloco) && pulos <= limite_de_pulo) {
		velocidade_vertical = -forca_do_pulo;
		pulos--;
	}
}

if (place_meeting(x, y + velocidade_vertical, obj_bloco)) {
	while (!place_meeting(x, y + sign(velocidade_vertical), obj_bloco)) {
		y += sign(velocidade_vertical);
	}
	
	velocidade_vertical = 0;
	pulos = limite_de_pulo;
}
else {
	velocidade_vertical += gravidade * massa;
}

direcao = -esquerda + direita;
velocidade_horizontal = velocidade * direcao;

if (direcao != 0 && direcao != sign(image_xscale) && sprite_index != spr_skeleton_attack_0) {
	image_xscale = -image_xscale;
}

if (place_meeting(x + velocidade_horizontal, y - 1, obj_bloco)) {
	while (!place_meeting(x + sign(velocidade_horizontal), y - 1, obj_bloco)) {
		x += sign(velocidade_horizontal);
	}
	
	velocidade_horizontal = 0;
}

switch (estado) {
	
	case "parado": {
		sprite_index = spr_skeleton_idle;
	
		if (velocidade_horizontal != 0) {
			estado = "movendo";
		}
		
		if (ataque) {
			image_index = 0;
			estado = "atacando";
		}
		
		break;
	}
	
	case "movendo": {
		sprite_index = spr_skeleton_run;
		
		if (velocidade_horizontal == 0) {
			estado = "parado";
		}
		
		if (ataque) {
			image_index = 0;
			estado = "atacando";
		}
		
		break;
	}
	
	case "atacando": {
		if (place_meeting(x, y + 1, obj_bloco)) {
			velocidade_horizontal = 0;
		}
		
		sprite_index = spr_skeleton_attack_0;
		
		if (image_index == image_number - 1) {
			estado = "parado";
		}
		
		if (image_index == 3 && dano == noone) {
			dano = instance_create_layer(x + sprite_width / 2, y - sprite_height / 2, layer, obj_dano);
			dano.nome = nome;
			dano.dano = forca_do_ataque;
			dano.pai = id;
		}
		
		break;
	}
	
	case "dano": {
		velocidade_horizontal = 0;
		sprite_index = spr_skeleton_hurt;
		
		if (image_index == image_number - 1) {
			estado = "parado";
		}
		
		break;
	}
	
	case "morte": {
		velocidade_horizontal = 0;
		sprite_index = spr_skeleton_dead;
		
		if (image_index == image_number - 1) {
			instance_destroy();
			room_restart();
		}
		
		break;
	}
}

y += velocidade_vertical;
x += velocidade_horizontal;

if (keyboard_check_pressed(vk_enter)) {
	room_restart();
}