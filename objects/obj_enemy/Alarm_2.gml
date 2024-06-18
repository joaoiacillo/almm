/// @description End Aware

if (state == ENEMY_STATES.AWARE) {
	state = ENEMY_STATES.MOVING;
	alarm[movement_alarm] = 1;
	instance_destroy(awareness_exclamation, false);
}
