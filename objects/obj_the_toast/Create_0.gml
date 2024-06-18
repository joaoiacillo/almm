music_stop();

// Inherit the parent event
event_inherited();

knockback_on_ded = false;

////////////////////////////////////////////////////////////////////////
#region Alarms

scream_alarm = 10;
initial_alarm = 11;

#endregion

////////////////////////////////////////////////////////////////////////
#region Velocity

max_vel_distance = 300;

calc_target_velocity = function ()
{	
	// By default these velocities are targeting the easy difficulty.
	var _min_vel = 1;
	var _max_vel = 2;
	
	switch (obj_wave_manager.wave_difficulty)
	{
		case WAVE_DIFFICULTIES.MEDIUM:
			_min_vel = 1.5;
			_max_vel = 2.5;
			break;
		case WAVE_DIFFICULTIES.HARD:
			_min_val = 2;
			_max_vel = 3.5;
			break;
	}
	
	var _distance = point_distance(x, y, obj_player.x, obj_player.y);
	_distance = clamp(_distance, 0, max_vel_distance);
	
	return lerp(_min_vel, _max_vel, _distance / max_vel_distance)
}

target_velocity = calc_target_velocity();
velocity = target_velocity;

#endregion

////////////////////////////////////////////////////////////////////////
#region Spawns

get_random_enemy = function ()
{
	static _spawnable_enemies = [obj_zombie, obj_red_zombie];
	static _max = array_length(_spawnable_enemies) - 1;
	return _spawnable_enemies[irandom(_max)];
}

spawn_enemies_near = function ()
{
	var _enemy = obj_zombie;
	var _max_qntt = 15;
	
	switch (difficulty)
	{
		case WAVE_DIFFICULTIES.MEDIUM:
			_max_qntt = 40;
			_enemy = get_random_enemy();
			break;
		case WAVE_DIFFICULTIES.HARD:
			_max_qntt = 60;
			_enemy = get_random_enemy();
			break;
	}
	
	if (instance_number(obj_enemy) > _max_qntt) return;
	
	repeat (irandom_range(1, 2)) {
		var _inst = instance_create_layer(x, y, "Entities", _enemy);
		_inst.state = ENEMY_STATES.MOVING;
		_inst.knockback_speed = irandom_range(1, 5);
		_inst.knockback_direction = irandom(360);
	}
}

try_explode_player = function () {
	if (instance_number(obj_iminent_explosion) > 8) return;
	
	repeat (irandom_range(1, 3)) {
		var _x = obj_player.x + random_range(-100, 100);
		var _y = obj_player.y + random_range(-100, 100);
		instance_create_layer(_x, _y, "Effects", obj_iminent_explosion);
	}
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Actions

enum BOSS_SHAKE_ACTIONS {
	FULL_SPAWN,
	PARTIAL_SPAWN,
	EXPLODE
}

shake_action = BOSS_SHAKE_ACTIONS.PARTIAL_SPAWN;

plan_scream = function (_longer = false) {
	var _val;
	if (_longer) _val = irandom_range(200, 250);
	else _val = irandom_range(80, 120);
	alarm[scream_alarm] = _val;
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Status

life = 0;
difficulty = obj_wave_manager.wave_difficulty;

switch (difficulty)
{
	case WAVE_DIFFICULTIES.EASY:
		life = irandom_range(400, 485);
		min_damage = 10;
		max_damage = 15;
		break;
	case WAVE_DIFFICULTIES.MEDIUM:
		life = irandom_range(485, 658);
		min_damage = 20;
		max_damage = 30;
		break;
	case WAVE_DIFFICULTIES.HARD:
		life = irandom_range(800, 1100);
		min_damage = 30;
		max_damage = 50;
		break;
}

knockback_proof = true;
hit_radius = 32;

#endregion

////////////////////////////////////////////////////////////////////////
#region Sprites & Animations

idle_sprite = spr_the_toast_idle;
walk_sprite = spr_the_toast_walk;

normal_speed = image_speed;
is_out_of_cinematic = false;

#endregion

// Sets up the initial env for the "comming" animation.
image_index = 0;
image_speed = 0;
visible = false;

state = ENEMY_STATES.ROAMING;

alarm[initial_alarm] = 250;
alarm[scream_alarm] = 600;