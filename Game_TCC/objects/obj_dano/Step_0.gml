outro = instance_place(x, y, obj_enemy_0);

if (outro) {
	if (outro.id != pai) {
		outro.foi_acertado = 1;
		outro.vida -= dano;
	}
}

instance_destroy();