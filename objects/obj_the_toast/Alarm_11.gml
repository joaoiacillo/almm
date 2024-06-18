/// @description Boss initial alarm

if (obj_player.life <= 0) return;

if (!visible) {
	audio_play_sound(snd_orchhit, 0, false);
	visible = true;
	image_speed = 2;
	
	repeat (5) {
		with (instance_create_layer(x, y, "Entities", obj_red_zombie)) {
			knockback_speed = 4;
			knockback_direction = irandom(360);
			state = ENEMY_STATES.ROAMING;
		}
	}
	
	alarm[11] = 150;
} else {
	audio_play_sound(snd_boss_scream, 0, false);
	music_switch(SONGS.BOSS);
	
	with (obj_enemy) {
		state = ENEMY_STATES.MOVING;
		alarm[1] = 1;
	}
	
	image_speed = 1;
	alarm[9] = 70;
	layer_set_visible("Screen_Shake_Effect", true);
}