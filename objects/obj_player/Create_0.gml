randomise();

reloading = false;

////////////////////////////////////////////////////////////////////////
#region Leaving blood trail

is_leaving_blood_trail = false;
blood_trail_alarm = 5;

leave_blood_trail = function ()
{
	is_leaving_blood_trail = true;
	alarm[blood_trail_alarm] = irandom_range(50, 100);
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Targeting

enemy_target = noone;

choose_enemy_target = function () {
	if (instance_exists(obj_the_toast)) {
		enemy_target = obj_the_toast;
	} else if (!instance_exists(enemy_target)) {
		enemy_target = instance_furthest(x, y, obj_enemy);
	}
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Scaling

// The sprite is huge for this game 16x16 tileset. So we shrink it down.

image_xscale = 0.6;
image_yscale = 0.6;

#endregion

////////////////////////////////////////////////////////////////////////
#region Movement Variables

move_direction = 0;
move_speed = 2;
run_speed = 3;

h_speed = 0;
v_speed = 0;

invincible = false;

#endregion

////////////////////////////////////////////////////////////////////////
#region Weapon & Shooting Variables

//weapon = "bow";

weapon = undefined; new Flute();

weapon_target_x = x;
weapon_target_y = y;
weapon_x = x;
weapon_y = y;

weapon_distance = 8;

// knockback_speed = weapon_base_knockback + weapon_knockback_multiplier * heavy_load 
knockback_speed = 0;
knockback_direction = 0;
weapon_base_knockback = 3;
weapon_knockback_multiplier = 0.2;

firerate = 25;
heavy_firerate_multiplier = 5;
shoot_alarm = 0;
can_shoot = true;
shoot_ocurring = false;

#endregion

////////////////////////////////////////////////////////////////////////
#region Flute Healing

heal_delay = 300;
heal_alarm = 4;
can_heal = true;

heal_beat = 0;
heal_bonus = 0;

heal = function ()
{
	audio_play_sound(snd_heal, 0, false);
	heal_beat = 0;
	life += min(40, irandom_range(1, heal_bonus / 2));
	instance_destroy(obj_healing_heart);
	instance_create_layer(x, y, "Effects", obj_player_heal);
	alarm[heal_alarm] = heal_delay;
}


#endregion

////////////////////////////////////////////////////////////////////////
#region Inventory

life = 100;
keys = 2;
points = 0;

add_points = function (_qntt)
{
	points += _qntt;
	obj_game_gui.points_angle = irandom_range(-30, 30);
	obj_game_gui.points_scale = 1.8;
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Collision Variables

collidees = [ obj_collidable, obj_grid_manager.walls_id ];

#endregion

////////////////////////////////////////////////////////////////////////
#region Aiming Variables

aim_direction = 0;

#endregion

////////////////////////////////////////////////////////////////////////
#region Random Positioning

var _toast_spawner = instance_find(obj_the_toast_spawner, irandom(instance_number(obj_the_toast_spawner) - 1));
x = _toast_spawner.x + random_range(-25, 25);
y = _toast_spawner.y + random_range(-25, 25);

if (obj_action_camera.follow == obj_player) {
	obj_action_camera.x = x;
	obj_action_camera.y = y;
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Initial Flute Spawning

var _iflute_distance = 32;
var _iflute_direction = irandom(360);

instance_create_layer(
	x + lengthdir_x(_iflute_distance, _iflute_direction),
	y + lengthdir_y(_iflute_distance, _iflute_direction),
	"Items", obj_flute_pickup
);

#endregion

////////////////////////////////////////////////////////////////////////
#region Debug GUI Variables

// Variables used to display out debug information about the player.

dbg_x_offset = 10;
dbg_y_offset = 20;
dbg_initial_y = 20;

dbg_gui_speed = "0";
dbg_h_direction = "None";
dbg_v_direction = "None";
dbg_aim_dir = "Untracked";
dbg_h_aim = "Untracked";

dbg_wall_collision = "None";

#endregion