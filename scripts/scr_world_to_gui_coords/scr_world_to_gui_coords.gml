function world_to_gui_coords(_wx, _wy){
	var _cl = camera_get_view_x(view_camera[0]);
	var _ct = camera_get_view_y(view_camera[0]);
	
	var _off_x = _wx - _cl;
	var _off_y = _wy - _ct;
	
	var _off_x_percent = _off_x / camera_get_view_width(view_camera[0]);
	var _off_y_percent = _off_y / camera_get_view_height(view_camera[0]);
	
	var _gui_x = _off_x_percent * display_get_gui_width();
	var _gui_y = _off_y_percent * display_get_gui_height();
	
	return [ _gui_x, _gui_y ];
}
