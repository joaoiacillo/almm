image_xscale = 1.6;
image_yscale = 1.6;

audio_play_sound(snd_explosion, 0, false);

min_damage = 5;
max_damage = 10;

var _ds = ds_list_create();
if (collision_circle_list(x, y, 48, [obj_player, obj_enemy], false, true, _ds, false) > 0) {
	for (var _inst_idx = 0; _inst_idx < ds_list_size(_ds); _inst_idx++) {
		var _inst =_ds[| _inst_idx];

		// The boss doesn't even feel it at all!
		if (_inst.object_index == obj_the_toast && !by_player) continue;
		
		var _dir = point_direction(x, y, _inst.x, _inst.y);
		_inst.knockback_direction = _dir;
		_inst.knockback_speed = 5.5;
		
		if (_inst.object_index == obj_player) hurt_player(self);
		else if (by_player) _inst.life -= 30;
	}
}
