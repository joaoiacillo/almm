var _nearest = instance_nearest(x, y, obj_player);

var _text_coords = world_to_gui_coords(x - sprite_width / 2, y - 20);

draw_text(_text_coords[0], _text_coords[1], "nearest: " + string(_nearest));
