enum SONGS {
	FLUTE,
	BOSS
}

global.music_current_playing = undefined;

function music_stop()
{
	switch (global.music_current_playing)
	{
		case SONGS.FLUTE:
			audio_stop_sound(snd_mus_its_small_but_it_works);
			break;
		case SONGS.BOSS:
			audio_stop_sound(snd_mus_the_one_in_control);
	}
}

function music_switch(_song)
{
	music_stop();
	
	global.music_current_playing = _song;
	switch (_song)
	{
		case SONGS.FLUTE:
			audio_play_sound(snd_mus_its_small_but_it_works, 10, true);
			break;
		case SONGS.BOSS:
			audio_play_sound(snd_mus_the_one_in_control, 10, true);
	}
}