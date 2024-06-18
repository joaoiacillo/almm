obj_player.weapon = new Flute();
audio_play_sound(snd_flute_pickup, 0, false);
music_switch(SONGS.FLUTE);
obj_wave_manager.next_wave();
instance_destroy();