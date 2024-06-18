////////////////////////////////////////////////////////////////////////
#region Next Wave Handler

if (get_current_wave_state() == WAVE_STATE.JUST_ENDED) {
	if (is_boss_battle) {
		is_boss_battle = false;
	}
	
	// Changes wave difficulty based on player points
	if (wave > 10 && obj_player.points > 120 && wave_difficulty == WAVE_DIFFICULTIES.EASY)
	{
		wave_difficulty = WAVE_DIFFICULTIES.MEDIUM;
	}
	else if (wave > 20 && obj_player.points > 320 && wave_difficulty == WAVE_DIFFICULTIES.MEDIUM)
	{
		wave_difficulty = WAVE_DIFFICULTIES.HARD;
	}
	
	// Setting current_spawned to a different value from wave_amount
	// automatically makes the wave manager think that another wave
	// is ocurring, even though no enemies are present yet.
	current_spawned = -1;
	alarm[next_wave_alarm] = 100;
}

#endregion

