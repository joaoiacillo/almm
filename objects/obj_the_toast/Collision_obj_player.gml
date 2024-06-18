if (!audio_is_playing(snd_boss_scream) && obj_player.life > 0 && !obj_player.invincible) {
	audio_play_sound(snd_boss_scream, 0, false);
}