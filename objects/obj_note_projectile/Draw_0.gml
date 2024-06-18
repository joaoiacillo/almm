var _x = x + sin(current_time / 32) * 2;
var _y = y + sin(current_time / 32) * 2;
draw_sprite_ext(spr_note_projectile, image_index, _x, _y, 0.6, 0.6, 0, c_white, image_alpha);