/*if (outro.nome == "inimigo") {
	outro = instance_place(x, y, obj_enemy_0);
}
else {
	outro = instance_place(x, y, obj_player);
}*/

//outro = instance_place(x, y, obj_enemy_0);

outro = instance_place(x, y, obj_player);

if (outro) {
	if (outro.id != pai) {
		if (outro.vida - dano > 0) {
			outro.estado = "dano";

		}
		else {
			outro.estado = "morte";
		}
		
		outro.image_index = 0;
		outro.vida -= dano;
	}
}

instance_destroy();