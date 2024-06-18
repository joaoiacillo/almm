if (obj_player.life <= 0) return;

if (event_data[? "message"] == "boss_shake_start") {
	audio_play_sound(snd_enemy_hit, 0, false);
	//layer_set_visible("Screen_Shake_Effect", true);
	
	if (irandom(100) > 70) {
		var _spawner = enemy_spawner_random(ENEMY_SPAWN_TYPE.NEAR_PLAYER);
		
		with (instance_create_layer(_spawner.x, _spawner.y, "Entities", obj_zombie)) {
			state = ENEMY_STATES.MOVING;
			alarm[movement_alarm] = 1;
		}
	}
	
	switch (shake_action) {
		case BOSS_SHAKE_ACTIONS.PARTIAL_SPAWN:
		case BOSS_SHAKE_ACTIONS.FULL_SPAWN:
			spawn_enemies_near();
			break;
		case BOSS_SHAKE_ACTIONS.EXPLODE:
			try_explode_player();
			break;
	}
}

if (event_data[? "message"] == "boss_shake_end" && state == ENEMY_STATES.SCREAMING) {
	//layer_set_visible("Screen_Shake_Effect", false);
}