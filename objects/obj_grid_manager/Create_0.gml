////////////////////////////////////////////////////////////////////////
#region Tileset Variables

walls_id = layer_tilemap_get_id("Walls");

#endregion

////////////////////////////////////////////////////////////////////////
#region Grid Variables

walls_id = layer_tilemap_get_id("Walls");

grid = mp_grid_create(
	0, 0,
	room_width / 16, room_height / 16,
	16, 16
);

//mp_grid_add_instances(grid, obj_room_walls, true);

var _w = room_width / 16;
var _h = room_height / 16;

var _idx;
for (var _y = 0; _y < _h; _y++) {
	for (var _x = 0; _x < _w; _x ++) {
		_idx = tilemap_get(walls_id, _x, _y);
		if (_idx == 0) continue;
		mp_grid_add_cell(grid, _x, _y);
	}
}

#endregion

