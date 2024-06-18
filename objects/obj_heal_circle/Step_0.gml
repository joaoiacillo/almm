circle_rad -= 2;
if (circle_rad <= 0) {
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