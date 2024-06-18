function create_room()
{	
	randomise();
	
	var _is_ground = function (_x, _y) {
		static _ground_id = layer_tilemap_get_id("Ground");
		return tilemap_get(_ground_id, _x, _y) == 13;
	};
	
	var _has_wall = function (_x, _y) {
		static _walls_id = layer_tilemap_get_id("Walls");
		return tilemap_get(_walls_id, _x, _y) > 0;
	}
	
	var _add_hernia = function (_x, _y, _has_wall) {
		// Yes. I'm ashamed of this, but I only got one day.
		if (_has_wall(_x + 1, _y)) _x -= 1;
		if (_has_wall(_x - 1, _y)) _x += 1;
		if (_has_wall(_x, _y + 1)) _y -= 1;
		if (_has_wall(_x, _y - 1)) _y += 1;
		
		if (_has_wall(_x + 1, _y + 1)) { _x -= 1; _y-= 1; }
		if (_has_wall(_x + 1, _y - 1)) { _x -= 1; _y += 1; }
		if (_has_wall(_x - 1, _y + 1)) { _x += 1; _y -= 1; }
		if (_has_wall(_x - 1, _y - 1)) { _x += 1; _y += 1; }
		
		static _hernia_id = layer_tilemap_get_id("Hernia");
		tilemap_set(_hernia_id, 5, _x, _y - 1);
		tilemap_set(_hernia_id, 6, _x + 1, _y - 1);
		
		tilemap_set(_hernia_id, 15, _x - 1, _y);
		tilemap_set(_hernia_id, 16, _x, _y);
		tilemap_set(_hernia_id, 17, _x + 1, _y);
		
		tilemap_set(_hernia_id, 26, _x - 1, _y + 1);
		tilemap_set(_hernia_id, 27, _x, _y + 1);
		tilemap_set(_hernia_id, 28, _x + 1, _y + 1);
		
		instance_create_layer(_x * 16 + 8, _y * 16 + 8, "Hernia", obj_enemy_spawner);
	}

	var _w = room_width / 16;
	var _h = room_height / 16;
	
	var _ground_idx;
	var _hernia_amount = 30;
	
	var _ground_positions = [];
	for (var _y = 0; _y < _h; _y++)
		for (var _x = 0; _x < _w; _x++)
			if (_is_ground(_x, _y))
				array_push(_ground_positions, [_x, _y]);
	
	_ground_positions = array_shuffle(_ground_positions);
	var _ground_positions_len = array_length(_ground_positions);
	
	for (var _i = 0; _i < _hernia_amount && _i < _ground_positions_len; _i++)
	{
		var _pos = _ground_positions[_i];
		var _x = _pos[0];
		var _y = _pos[1];
		
		var _nearest = instance_nearest(_x * 16, _y * 16, obj_enemy_spawner);
		if (_nearest && point_distance(
			_x * 16, _y * 16,
			_nearest.x, _nearest.y
		) < 64) {
			continue;
		}
		
		_add_hernia(_x, _y, _has_wall);
	}
}