/// @description Next Wave Alarm

if (obj_player.life <= 0) return;

if (get_current_wave_state() == WAVE_STATE.BLOCKED) return;

wave++;

if (wave % 7 == 0) {
	// Oh no, here comes him... THE TOAST
	is_boss_battle = true;
	boss_spawn_random();
	exit;
}

wave_amount = generate_wave_amount();

spawners = instance_number(obj_enemy_spawner);
current_spawned = 0;

//audio_play_sound(snd_new_round, 0, false);

alarm[spawn_alarm] = irandom_range(1, 20);
