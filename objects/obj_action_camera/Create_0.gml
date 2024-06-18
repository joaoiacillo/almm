cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);

follow = obj_player;

x_target = follow.x;
y_target = follow.y;

cam_zoom_x = cam_width * 0.7;
cam_zoom_y = cam_height * 0.7;

x = x_target;
y = y_target;

zoom = 1;

camera_set_view_size(view_camera[0], cam_zoom_x, cam_zoom_y);