/// @description Check for beat

var _mouse_dis = point_distance(
	circle_x, circle_y,
	window_mouse_get_x(), window_mouse_get_y()
)

if (_mouse_dis <= circle_mouse_target && circle_rad - 10 <= circle_target_rad) {
	obj_player.heal_beat++;
	obj_player.weapon.play_shoot_sound();
	obj_player.heal_bonus += circle_target_rad - circle_rad;
	instance_destroy();
	
	if (obj_player.heal_beat <= 5) {
		obj_healing_heart.beat();
		instance_create_layer(0, 0, "Effects", object_index);
	}
	else
		obj_player.heal();
} else {
	audio_stop_sound(snd_heart_beat);
	instance_destroy(obj_healing_heart);
	with (obj_player)
	{
		heal_beat = 0;
		alarm[heal_alarm] = heal_delay
	}
	hurt_player(self);
	instance_destroy();
}
