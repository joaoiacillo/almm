function enemy_spawned_random() {
	var _qntt = instance_number(obj_enemy);
	if (_qntt == 0) return noone;
	var _idx = irandom(_qntt);
	return instance_find(obj_enemy, _idx);
}

function enemy_spawner_size() {
	return instance_number(obj_enemy_spawner);
}

function enemy_spawner_near_player() {
	var _inst = noone;
	var _idx;
	static _spawners = enemy_spawner_size();
	
	var _cur = 0;
	do {
		_cur++;
		_idx = irandom(_spawners - 1);
		_inst = instance_find(obj_enemy_spawner, _idx);
		// This deals with infinite loops.
		if (_cur == _spawners) break;
		with (_inst) {
			if (point_distance(x, y, obj_player.x, obj_player.y) > 128) {
				_inst = noone;
			}
		}
	} until (_inst != noone);
	
	return _inst;
}

enum ENEMY_SPAWN_TYPE { TRUE_RANDOM, NEAR_PLAYER };

function enemy_spawner_random(_type = ENEMY_SPAWN_TYPE.TRUE_RANDOM) {
	if (_type == ENEMY_SPAWN_TYPE.NEAR_PLAYER)
		return enemy_spawner_near_player();
	
	var _idx = irandom(enemy_spawner_size() - 1);
	return instance_find(obj_enemy_spawner, _idx);
}

function enemy_create(_enemy, _x, _y) {
	return instance_create_layer(_x, _y, "Entities", _enemy);
}

enum ENEMY_GET_TYPE { TRUE_RANDOM, BY_WAVE };

function enemy_random(_type = ENEMY_GET_TYPE.TRUE_RANDOM) {
	var _enemy;
	
	static _tr_enemies = [obj_zombie, obj_red_zombie];
	var _idx;
	switch (_type) {
		case ENEMY_GET_TYPE.TRUE_RANDOM:
			_idx = irandom(array_length(_tr_enemies) - 1);
			_enemy = _tr_enemies[_idx];
			break;
		case ENEMY_GET_TYPE.BY_WAVE:
			if (obj_wave_manager.wave > 5)
			{
				_enemy = irandom(100 > 60) ? obj_red_zombie : obj_zombie;
			}
			else if (obj_wave_manager > 7)
			{
				_enemy = irandom(100 > 40) ? obj_red_zombie : obj_zombie;
			}
			else _enemy = obj_zombie;
			break;
	}
	
	return _enemy;
}

function enemy_spawn_random(_type = ENEMY_SPAWN_TYPE.TRUE_RANDOM, _get_type = ENEMY_GET_TYPE.TRUE_RANDOM) {
	var _spawner = enemy_spawner_random(_type);

	with (_spawner) {
		var _enemy = enemy_random(_get_type);
		
		var _x = x + 8;
		var _y = y + 8;

		var _inst = enemy_create(_enemy, _x, _y);
		
		// 50% of chance to spawn moving towards the player.
		// Doesn't care about getting aware.
		if (irandom_range(0, 100) >= 50)
			_inst.state = ENEMY_STATES.MOVING;
	}
}