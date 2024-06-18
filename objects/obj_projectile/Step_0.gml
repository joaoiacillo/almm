#region Movement & Collision

var _x_ahead = x + lengthdir_x(velocity, image_angle);
var _y_ahead = y + lengthdir_y(velocity, image_angle);

//if (mp_grid_get_cell(
//	obj_grid_manager.grid,
//	floor(_x_ahead / 16),
//	floor(_y_ahead / 16)
//) == -1) {
//	projectile_ded();
//	exit;
//}

x = _x_ahead;
y = _y_ahead;

#endregion