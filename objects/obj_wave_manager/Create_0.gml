////////////////////////////////////////////////////////////////////////
#region Wave

enum WAVE_STATE {
	BLOCKED,
	OCURRING,
	JUST_ENDED
}

enum WAVE_DIFFICULTIES {
	EASY,
	MEDIUM,
	HARD
}

wave = 0;
wave_difficulty = WAVE_DIFFICULTIES.EASY;
wave_amount = 0;
wave_blocked = false;

get_current_wave_state = function ()
{
	if (wave_blocked) return WAVE_STATE.BLOCKED;
	
	var _has_enemies = instance_number(obj_enemy) > 0;
	var _all_spawned = current_spawned == wave_amount;
	
	// Boss battles deal with spawn differently. That's why it has
	// it's own special variable. We all love boss battles <3
	if (!_has_enemies && (_all_spawned || is_boss_battle)) {
		return WAVE_STATE.JUST_ENDED;
	}
	
	return WAVE_STATE.OCURRING;
};

generate_wave_amount = function ()
{
	var _min = 1;
	var _max = 2;

	switch (wave_difficulty) {
		case WAVE_DIFFICULTIES.EASY:
			if (wave > 3) {
				_min = 4;
				_max = 7;
			}
			break;
		case WAVE_DIFFICULTIES.MEDIUM:
			_min = 7;
			_max = 14;
			break;
		case WAVE_DIFFICULTIES.HARD:
			_min = 8;
			_max = 20;
			break;
	}

	return irandom_range(_min, _max);
}

next_wave = function ()
{
	alarm[next_wave_alarm] = 150;
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Spawns

spawners = 0;
toast_spawners = instance_number(obj_the_toast_spawner);
current_spawned = -1;

#endregion

////////////////////////////////////////////////////////////////////////
#region Enemies & Boss

enemies = [obj_zombie, obj_red_zombie];

is_boss_battle = false;

#endregion

////////////////////////////////////////////////////////////////////////
#region Alarms

next_wave_alarm = 0;
spawn_alarm = 1;

#endregion

////////////////////////////////////////////////////////////////////////
#region Create Room

create_room();

#endregion
