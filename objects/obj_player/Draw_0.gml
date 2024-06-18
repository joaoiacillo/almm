draw_self();

////////////////////////////////////////////////////////////////////////
#region Weapon Draw

if (weapon)
	weapon.draw(weapon_x, weapon_y, aim_direction);

//draw_line(
//	weapon_x, weapon_y,
//	weapon_x + lengthdir_x(500, aim_direction),
//	weapon_y + lengthdir_y(500, aim_direction)
//);

#endregion

////////////////////////////////////////////////////////////////////////
#region Enemy / Boss Location

// O enemy_target é sempre definido no step event para um inimigo.
// Quando o inimigo é abatido, ele troca para outro. Caso o boss
// esteja na onda, ele é o único apontado:

//  [Código no step event]

/// if (instance_exists(obj_the_toast)) {
///	  enemy_target = obj_the_toast;
/// }
/// 
/// if (!instance_exists(enemy_target)) {
///	  enemy_target = enemy_spawned_random();
/// }

if (enemy_target != noone && instance_exists(enemy_target)) {
	var _enemy_dis = point_distance(x, y, enemy_target.x, enemy_target.y);
	
	if (_enemy_dis < 120) return;
	if (obj_action_camera.follow != obj_player) return;
	
	var _boss_dir = point_direction(x, y, enemy_target.x, enemy_target.y);
	
	// [sin(current_time / 64) * 4]
	//  Cálculo para adicionar o movimento de "vai-e-volta" à flecha.
	var _arr_dis = 90 + sin(current_time / 64) * 4;

	var _arr_x = x + lengthdir_x(_arr_dis, _boss_dir);
	var _arr_y = y + lengthdir_y(_arr_dis, _boss_dir);
	
	draw_sprite_ext(
		spr_boss_arrow, 0,
		_arr_x, _arr_y,
		1, 1,
		_boss_dir, c_white, 1
	);
}

#endregion

if (reloading) {
	draw_text_transformed(x - 15, y + 10, "Reloading...", 0.3, 0.3, 0);
}