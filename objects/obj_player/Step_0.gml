if (life <= 0) {
	visible = false;
	return;
}

image_alpha = invincible ? 0.7 : 1.0;

life = clamp(life, 0, 100);

depth = -y;

choose_enemy_target();

////////////////////////////////////////////////////////////////////////
#region Keyboard Input

var _up_key = keyboard_check( ord("W") );
var _left_key = keyboard_check( ord("A") );
var _down_key = keyboard_check( ord("S") );
var _right_key = keyboard_check( ord("D") );
var _run_key = keyboard_check( vk_shift );

#endregion

////////////////////////////////////////////////////////////////////////
#region Animation

if (_run_key) image_speed = 2.5;
else image_speed = 1;

#endregion

////////////////////////////////////////////////////////////////////////
#region Blood Trail

if (collision_circle(x, y, 5, obj_blood, false, true) != noone) {
	leave_blood_trail();
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Movement & Collisions

var _h_key = _right_key - _left_key;
var _v_key = _down_key - _up_key;

move_direction = point_direction(0, 0, _h_key, _v_key);
//move_direction = arctan2(-_v_key, _h_key) * (180 / pi);

var _input_level = point_distance(0, 0, _h_key, _v_key);
// Clampping the distance for removing the 0.41 pixel-compensation
// on diagonals.
_input_level = clamp(_input_level, 0, 1);
var _speed = (_run_key ? run_speed : move_speed) * _input_level;
dbg_gui_speed = string(_speed) + (_run_key ? "*" : "");

h_speed = lengthdir_x(_speed, move_direction);
v_speed = lengthdir_y(_speed, move_direction);

if (knockback_speed > 0 && obj_action_camera.follow == obj_player) {
	knockback_speed -= 0.3;
	// Making it impossible for knockback_speed to go below 0
	knockback_speed = max(knockback_speed, 0);
	
	h_speed = lengthdir_x(knockback_speed, knockback_direction);
	v_speed = lengthdir_y(knockback_speed, knockback_direction);
}

if (h_speed < 0) dbg_h_direction = "Left";
else if (!h_speed) dbg_h_direction = "None";
else dbg_h_direction = "Right";

if (v_speed < 0) dbg_v_direction = "Up";
else if (!v_speed) dbg_v_direction = "None";
else dbg_v_direction = "Down";

var _h_target = x + h_speed;
var _v_target = y + v_speed;

var _h_ahead = place_meeting(_h_target, y, collidees);
var _v_ahead = place_meeting(x, _v_target, collidees);

if (_h_ahead) {
	h_speed = 0;
	dbg_wall_collision = "H:" + string(_h_target);
}

if (_v_ahead) {
	v_speed = 0;
	dbg_wall_collision = "V:" + string(_v_target);
}

if (_h_ahead && _v_ahead) {
	dbg_wall_collision = (
		"H:" + string(_h_target)	+
		"+"							+
		"V:" + string(_v_target)
	);
}
else if (!_h_ahead && !_v_ahead) {
	dbg_wall_collision = "None";
}

if (obj_action_camera.follow == obj_player) {
	x += h_speed;
	y += v_speed;
}

if (h_speed != 0 || v_speed != 0) {
	sprite_index = spr_player_walk;
} else {
	sprite_index = spr_player_idle;
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Facing

if (x < mouse_x) {
	image_xscale = 0.6;
} else {
	image_xscale = -0.6;	
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Weapon & Aiming

weapon_target_x = x + _h_ahead + lengthdir_x(weapon_distance, aim_direction);
weapon_target_y = y + _v_ahead + lengthdir_y(weapon_distance, aim_direction);

weapon_x = lerp(weapon_x, weapon_target_x, 0.5);
weapon_y = lerp(weapon_y, weapon_target_y, 0.5);

aim_direction = point_direction(
	x, y,
	mouse_x, mouse_y
);

dbg_aim_dir = string(aim_direction);

#endregion

////////////////////////////////////////////////////////////////////////
#region STUDY LATER

/*
# LERP WITH MOVEMENT

For some reason using lerp for smoothing movements with this
implementation doesn't work, and only requires a higher number
of speed for the entity to move quickly if the lerp amnt is
low.

```
var _h_target = x + h_speed;
var _v_target = y + v_speed;

x = lerp(x, _h_target, 0.1);
y = lerp(y, _v_target, 0.1);
```
*/

#endregion