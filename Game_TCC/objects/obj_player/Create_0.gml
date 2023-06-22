gravidade = .5;
massa = 1;
velocidade_vertical = 0;
forca_do_pulo = 10;
velocidade = 4;
velocidade_horizontal = 0;
estado = "parado";
tamanho = .75;
dano = noone;
if (room == Fase1) {
	vida_maxima = 3;
	global.backup_forca_do_ataque = 1;
}
else if (room == Fase2) {
	vida_maxima = 6;
}
else if (room == Fase3) {
	vida_maxima = 9;
}
else {
	vida_maxima = 3;
	global.backup_forca_do_ataque = 1;
}
forca_do_ataque = global.backup_forca_do_ataque;
vida = vida_maxima;
nome = "player";
limite_de_pulo = 2;
pulos = limite_de_pulo;
chaves = 0;
vida_dropada = 0;