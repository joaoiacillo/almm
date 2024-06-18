depth = -10000;

scale = lerp(scale, target_scale, 0.2);
image_alpha = lerp(image_alpha, target_alpha, 0.2);

image_xscale = scale;
image_yscale = scale;

x = obj_player.x + obj_player.h_speed;
y = obj_player.y + obj_player.v_speed;
