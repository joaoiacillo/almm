function tilemap_get_id_at_pixel(_tilemap_id, _x, _y) {
	return tilemap_get_at_pixel(_tilemap_id, _x, _y) & tile_index_mask;
}