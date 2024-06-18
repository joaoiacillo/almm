/// @description Shoot

if (life <= 0 || !weapon) return;

if (obj_action_camera.follow != obj_player) return;

if (can_shoot) {
	can_shoot = false;
	weapon.shoot(weapon_x, weapon_y, aim_direction);
	
	alarm[shoot_alarm] = firerate;
}
