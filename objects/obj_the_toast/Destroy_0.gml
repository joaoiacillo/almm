obj_action_camera.follow = obj_player;
music_switch(SONGS.FLUTE);

switch (difficulty)
{
	case WAVE_DIFFICULTIES.EASY:
		obj_player.points += irandom_range(50, 100);
		break;
	case WAVE_DIFFICULTIES.MEDIUM:
		obj_player.points += irandom_range(130, 200);
		break;
	case WAVE_DIFFICULTIES.HARD:
		obj_player.points += irandom_range(300, 500);
		break;
}