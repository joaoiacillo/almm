if (obj_action_camera.follow != obj_player) {
	obj_action_camera.follow = obj_player;
	layer_set_visible("Screen_Shake_Effect", false);
	with (obj_enemy) {
		is_cinematic = false;
	}
	is_out_of_cinematic = true;
}
