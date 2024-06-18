function boss_spawner_away_from_player() {
	var _inst = noone;
	
	do {
		_inst = instance_find(obj_the_toast_spawner, irandom(toast_spawners - 1));
		with (_inst) {
			if (collision_circle(x, y, 256, obj_player, false, true)) {
				_inst = noone;
			}
		}
	} until (_inst != noone);
	
	return _inst;
}

function boss_spawn_random() {
	var _spawner = boss_spawner_away_from_player();
	
	with (obj_enemy) is_cinematic = true;
	
	enemy_create(obj_the_toast, _spawner.x, _spawner.y);
	
	obj_action_camera.follow = obj_the_toast;
	audio_play_sound(snd_boss_appeared, 1, false);
}