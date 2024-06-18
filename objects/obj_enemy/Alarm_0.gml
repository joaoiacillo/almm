/// @description Roaming direction toggle

if (state == ENEMY_STATES.ROAMING) {
	image_xscale = -image_xscale;
	alarm[roaming_alarm] = random_range(100, 300);
}
