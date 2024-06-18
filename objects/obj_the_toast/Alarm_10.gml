/// @description Scream alarm

if (obj_player.life <= 0) return;

if (state == ENEMY_STATES.SCREAMING) {
	state = ENEMY_STATES.MOVING;
	image_speed = normal_speed;
	//layer_set_visible("Screen_Shake_Effect", false);
	alarm[movement_alarm] = 1;
	plan_scream();
	return;
}

if (state != ENEMY_STATES.MOVING) {
	plan_scream();
	return;
}

path_end();

switch (difficulty)
{
	case WAVE_DIFFICULTIES.EASY:
		shake_action = BOSS_SHAKE_ACTIONS.PARTIAL_SPAWN;
		break;
	case WAVE_DIFFICULTIES.MEDIUM:
		shake_action = BOSS_SHAKE_ACTIONS.FULL_SPAWN;
		break;
	case WAVE_DIFFICULTIES.HARD:
		if (irandom(100) > 55) {
			shake_action = BOSS_SHAKE_ACTIONS.EXPLODE;
		} else {
			shake_action = BOSS_SHAKE_ACTIONS.FULL_SPAWN;
		}
		break;
}

state = ENEMY_STATES.SCREAMING;
sprite_index = spr_the_toast_jump;
image_speed = random_range(1, 3);

audio_play_sound(snd_boss_scream, 0, false);

plan_scream(true);
