draw_self();

//draw_text(x, y - sprite_height * 2, estado);
draw_text(x, y - sprite_height * 3, sign(velocidade_vertical));

hp = vida / vida_maxima * 100;
largura_da_barra = vida_maxima * 10;
altura_da_barra = 10;
margem_da_barra = 15;
x_da_barra = camera_get_view_x(view_camera[0]) + margem_da_barra;
y_da_barra = camera_get_view_y(view_camera[0]) + margem_da_barra;
draw_healthbar(x_da_barra, y_da_barra, x_da_barra + largura_da_barra, y_da_barra + altura_da_barra, hp, c_black, c_red, c_lime, 0, 1, 1);

x_da_chave = camera_get_view_x(view_camera[0]) + 15;
y_da_chave = camera_get_view_y(view_camera[0]) + 40;
draw_sprite(spr_chave0, 0, x_da_chave, y_da_chave);
draw_text(x_da_chave + 30, y_da_chave - 10,": " + string(chaves));