////////////////////////////////////////////////////////////////////////
#region States

enum ENEMY_STATES {
	ROAMING,
	AWARE,
	MOVING,
	DEAD,
	
	// BOSS STATES
	SCREAMING
};

state = ENEMY_STATES.MOVING;

#endregion

////////////////////////////////////////////////////////////////////////
#region Stats

life = 6;
velocity = 0.9;
hit_radius = 16;

min_damage = 1;
max_damage = 3;

#endregion

////////////////////////////////////////////////////////////////////////
#region Alarms

roaming_alarm = 0;
movement_alarm = 1;
aware_alarm = 2;
sight_alarm = 3;

#endregion

////////////////////////////////////////////////////////////////////////
#region Movement Variables

precise_mov = false;
is_static = false;
path = path_add();
randomness = 50;

last_x = x;
last_y = y;

#endregion

////////////////////////////////////////////////////////////////////////
#region Knockback Variables

knockback_proof = false;
knockback_speed = 0;
knockback_direction = 0;

#endregion

////////////////////////////////////////////////////////////////////////
#region Ded Variables

target_angle = 360;
knockback_on_ded = true;

#endregion

////////////////////////////////////////////////////////////////////////
#region Player Detection

detection_radius = 128;
awareness_exclamation = noone;

#endregion

////////////////////////////////////////////////////////////////////////
#region Sprite Directions

idle_sprite = undefined;
walk_sprite = undefined;

up_sprite = undefined;
left_sprite = undefined;
down_sprite = undefined;
right_sprite = undefined;

#endregion

alarm[movement_alarm] = 1;
//alarm[roaming_alarm] = random_range(100, 300);