if (nome != "player") {
	outro_player = instance_place(x, y, obj_player);
	
	if (outro_player) {
		outro = outro_player;
	}
}
else {
	outro_esqueleto = instance_place(x, y, obj_esqueleto);
	outro_esqueleto_vermelho = instance_place(x, y, obj_esqueleto_vermelho);
	
	if (outro_esqueleto) {
		outro = outro_esqueleto;
	}
	
	if (outro_esqueleto_vermelho) {
		outro = outro_esqueleto_vermelho;
	}
}

if (outro) {
	if (outro.id != pai) {
		if (outro.vida - dano > 0) {
			if (outro.estado != "dano") {
				outro.image_index = 0;
				outro.vida -= dano;
			}
			
			outro.estado = "dano";
		}
		else {
			if (outro.estado != "dano" && outro.estado != "morte") {
				outro.image_index = 0;
				outro.vida -= dano;
				outro.estado = "morte";
			}
		}
	}
}

instance_destroy();