draw_self();

//draw_text(x, y - sprite_height * 2, estado);

//draw_line(x, y - sprite_height / 3, x + visao * sign(velocidade_horizontal), y - sprite_height / 3);

hp = vida / vida_maxima * 100;
tamanho_da_barra = vida_maxima * 10;
draw_healthbar(x - tamanho_da_barra / 2, y - 100, x + tamanho_da_barra / 2,  y - 103, hp, c_black, c_red, c_lime, 0, 1, 1);
