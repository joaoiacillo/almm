if (obj_player.life <= 0) visible = false;

if (obj_player.life <= 0 || is_static) { 
	path_end();
}

depth = -y;

if (life <= 0) {
	state = ENEMY_STATES.DEAD;
	instance_destroy(awareness_exclamation, false);
	instance_destroy();
	exit;
}

image_alpha = lerp(image_alpha, 1, 0.1);

////////////////////////////////////////////////////////////////////////
#region Knockback

if ((knockback_speed > 0 && !knockback_proof) || knockback_speed > 4) {
	path_end();
	
	var _h_speed = lengthdir_x(knockback_speed, knockback_direction);
	var _v_speed = lengthdir_y(knockback_speed, knockback_direction);
	
	var _h_target = x + _h_speed;
	var _v_target = y + _v_speed;
	
	var _h_ahead = place_meeting(_h_target, y, obj_player.collidees);
	var _v_ahead = place_meeting(x, _v_target, obj_player.collidees);

	//if (_h_ahead) _h_target = x;
	//if (_v_ahead) _v_target = y;
	
	if (_h_ahead || _v_ahead) knockback_direction = direction_opposite(knockback_direction);
	
	knockback_speed -= 0.3;
	x = _h_target;
	y = _v_target;
	
	if (knockback_speed <= 0.2 && state == ENEMY_STATES.DEAD)
	{
		instance_destroy();
	}
}

#endregion

if (state == ENEMY_STATES.DEAD)
{
	image_angle = lerp(image_angle, target_angle, 0.1);
	return;
}

////////////////////////////////////////////////////////////////////////
#region Check arrow collision

var _projectile = collision_circle(x, y, hit_radius, obj_projectile, true, true);
if (_projectile != noone) {
	if (_projectile.damage == 0) return;
	
	var _next_life = life - _projectile.damage;

	knockback_direction = _projectile.image_angle;
	knockback_speed = enemy_knockback_calculate(_projectile);

	projectile_reduce_durability(_projectile, life);
	image_alpha = 0.5;

	audio_play_sound(snd_enemy_hit, 0, false);

	// The enemy died 'cause it was hit with a final attack.
	if (_next_life <= 0) {
		if (!obj_wave_manager.is_boss_battle)
		{
			obj_player.add_points(max(1 + (life + irandom(10)) - _projectile.damage, 1));
		}
		
		instance_destroy(awareness_exclamation);
		if (!knockback_on_ded) {
			instance_destroy();
			return;
		}
		
		sprite_index = idle_sprite;
		state = ENEMY_STATES.DEAD;
		knockback_speed = 7;
		
		var _inst = instance_create_layer(x, y, "Effects", obj_blood);
		_inst.image_angle = knockback_direction + irandom_range(-50, 50);
		return;
	} else {
		life = _next_life;
	
		if (state == ENEMY_STATES.ROAMING) {
			enemy_aware();
		}
	}
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Sprite Change

if (state == ENEMY_STATES.MOVING) {
	if (x == last_x && y == last_y) {
		sprite_index = idle_sprite;
	}

	if (walk_sprite == undefined) {
		if (last_y > y) {
			sprite_index = up_sprite;
		} else if (last_y < y) {
			sprite_index = down_sprite;
		}

		if (last_x > x) {
			sprite_index = left_sprite;
		} else if (last_x < x) {
			sprite_index = right_sprite;
		}
	} else {
		if (last_x != x || last_y != y) {
			sprite_index = walk_sprite;
			image_xscale = last_x < x ? -1 : 1;
		}
	}
}

last_x = x;
last_y = y;

#endregion

////////////////////////////////////////////////////////////////////////
#region Awareness

if (awareness_exclamation) {
	with (awareness_exclamation) { x = other.x; y = other.y - 15; }
}

if (state == ENEMY_STATES.ROAMING) {
	// If player was detected, it enters an aware state for warning the
	// player that the enemy now knows he's there.
	if (is_player_in_enemy_detect_area()) {
		enemy_aware();
	}
}

if (state == ENEMY_STATES.AWARE) {
	if (walk_sprite == undefined) {
		if (obj_player.x < x) sprite_index = left_sprite;
		else if (obj_player.x > x) sprite_index = right_sprite;
		else sprite_index = down_sprite;
	} else {
		image_xscale = obj_player.x < x ? -1 : 1;
	}
}

#endregion
