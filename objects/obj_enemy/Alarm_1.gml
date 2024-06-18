/// @description Movement

if (state == ENEMY_STATES.MOVING && obj_player.life > 0) {
	//if (is_player_in_enemy_detect_area()) alarm[sight_alarm] = 300;
	
	if ((knockback_speed <= 0 || knockback_proof) && !is_static) {
		enemy_follow_player();
	}
	
	alarm[movement_alarm] = precise_mov ? 1 : irandom_range(10, 30);
}
