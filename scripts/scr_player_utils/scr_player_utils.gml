function hurt_player(_other) {
	with (obj_player) {
		if (life <= 0) return;
		
		if (invincible || (variable_instance_exists(_other, "state") && _other.state != ENEMY_STATES.MOVING)) return;

	
		if (_other.object_index != obj_explosion) {
			if (knockback_speed > 0) return;
			knockback_speed = 5;
			knockback_direction = direction_opposite(aim_direction);
		}
		
		life -= irandom_range(_other.min_damage, _other.max_damage);

		invincible = true;
		alarm[2] = 35;

		shoot_ocurring = false;
		can_shoot = true;

		if (life <= 0) {
			obj_enemy.state = ENEMY_STATES.ROAMING;
			audio_stop_all();
			with(obj_enemy) path_end();
			layer_set_visible("Top_BG", true);
			instance_create_layer(x, y, "Top_Objects", obj_heart);
		} else {
			audio_play_sound(snd_player_hitty, 0, false);
		}
	}
}
