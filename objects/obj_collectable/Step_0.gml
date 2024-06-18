if (collision_circle(x, y, pickup_radius, obj_player, false, true) != noone) {
	target_x = obj_player.x;
	target_y = obj_player.y;
	
	x = lerp(x, target_x, 0.2);
	y = lerp(y, target_y, 0.2);
}

y += wave_intensity * sin(current_time / wave_frequency);
