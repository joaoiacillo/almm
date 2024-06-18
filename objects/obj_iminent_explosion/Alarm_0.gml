if (obj_player.life <= 0) return;

if (image_speed > 0) {
	instance_change(obj_explosion, true);
	return;
}

image_speed = 3;
alarm[0] = irandom_range(30, 80);