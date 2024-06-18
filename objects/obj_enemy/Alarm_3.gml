/// @description Lost Sight

if (state == ENEMY_STATES.MOVING) {
	if (floor(random_range(0, 100)) < 80) {
		alarm[sight_alarm] = 300;
	} else {
		state = ENEMY_STATES.ROAMING;
		path_end();
	}
}
