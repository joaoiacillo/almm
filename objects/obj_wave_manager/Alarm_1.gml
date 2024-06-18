/// @description Spawn

if (obj_player.life <= 0) return;

var _amount;

if (wave_difficulty == WAVE_DIFFICULTIES.EASY) _amount = irandom_range(1, 3);
else if (wave_difficulty == WAVE_DIFFICULTIES.MEDIUM) _amount = irandom_range(5, 10);
else _amount = irandom_range(12, min(irandom_range(20, 30), wave));

for (var _i = 0; _i < _amount; _i++) {
	switch (wave_difficulty)
	{
		case WAVE_DIFFICULTIES.EASY:
			enemy_spawn_random(ENEMY_SPAWN_TYPE.NEAR_PLAYER, ENEMY_GET_TYPE.BY_WAVE);
			break;
		case WAVE_DIFFICULTIES.MEDIUM:
			enemy_spawn_random(ENEMY_SPAWN_TYPE.TRUE_RANDOM, ENEMY_GET_TYPE.BY_WAVE);
			break;
		case WAVE_DIFFICULTIES.HARD:
			enemy_spawn_random();
	}
}

current_spawned++;

if (current_spawned < wave_amount) {
	if (wave < 7) alarm[spawn_alarm] = irandom_range(50, 100);
	else alarm[spawn_alarm] = irandom_range(10, 50);
}
