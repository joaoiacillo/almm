draw_sprite_ext(
	spr_heal_circle, 0,
	circle_x, circle_y,
	1.5, 1.5,
	0, c_lime, 1
);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(circle_x, circle_y, string(obj_player.heal_beat), 1.5, 1.5, 0);

draw_circle(circle_x, circle_y, circle_rad, true);