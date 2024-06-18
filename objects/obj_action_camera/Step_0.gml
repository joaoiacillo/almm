if (follow != noone)
{
	x_target = follow.x;
	y_target = follow.y;
}

x += (x_target - x) / 5;
y += (y_target - y) / 5;

camera_set_view_pos(
	view_camera[0],
	x - (cam_zoom_x * 0.5),
	y - (cam_zoom_y * 0.5)
);