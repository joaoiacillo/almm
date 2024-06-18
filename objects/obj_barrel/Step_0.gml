visible = obj_player.life > 0 && !regen;
if (!regen) image_alpha = lerp(image_alpha, 1, 0.05);
depth = -y;