function enemy_follow_player() {
	// Freeing up the last path.
	if (path != undefined) path_delete(path);
	path = path_add();
	
	// Quantidade de aleatoriedade que será adicionada ao path do
	// inimigo. Caso a aleatoriedade seja baixa, o inimigo é
	// esperto. Caso seja alta, o inimigo pode ser considerado
	// "burro".
	// É interessante colocar aleatoriedade baixa para inimigos
	// velozes para que o player tenha mais chance de acerto.
	var _range = randomness;

	target_x = obj_player.x;
	target_y = obj_player.y;
	
	if (!precise_mov) {
	
		var _waypoint_x = target_x + random_range(-_range, _range);
		var _waypoint_y = target_y + random_range(-_range, _range);

		mp_grid_path(obj_grid_manager.grid, path, x, y, _waypoint_x, _waypoint_y, true);
		
		// Criando um caminho extra temporário para dar o ar de
		// "estupidez" ao inimigo.
		var _temp_path = path_add();
		mp_grid_path(obj_grid_manager.grid, _temp_path, _waypoint_x, _waypoint_y, target_x, target_y, true);
		path_append(path, _temp_path);
		path_delete(_temp_path);
	
	}
	// Inimigos com movimentos precisos não podem ter aleatoriedade.
	// Exemplo: O chefão torrada. Ele precisa sempre ir na pos. do player.
	else {
		mp_grid_path(obj_grid_manager.grid, path, x, y, target_x, target_y, true);
	}

	// Slide on path
	path_start(path, velocity, path_action_stop, false);
}

function is_player_in_enemy_detect_area() {
	return collision_circle(x, y, detection_radius, obj_player, false, true) != noone
}

// @param {Id} _projectile
function enemy_knockback_calculate(_projectile) {
	return _projectile.velocity / 2;
}

function enemy_aware() {
	state = ENEMY_STATES.AWARE;
		
	awareness_exclamation = instance_create_layer(
		x, y - 15, "Effects", obj_exclamation
	);
	
	if (!audio_is_playing(snd_exclamation))
		audio_play_sound(snd_exclamation, 0, false);
		
	alarm[aware_alarm] = ceil(random_range(40, 60));
}
