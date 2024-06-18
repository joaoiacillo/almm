return;

var _dbg_speed_text = (
	"speed: " + dbg_gui_speed	+
	" (H:" + dbg_h_direction	+
	", V:" + dbg_v_direction	+
	")"
);

var _dbg_aim_text = (
	"aim: " + dbg_aim_dir		+
	" (H:" + dbg_h_aim			+
	")"
);

var _dbg_texts = [
	"[Game]",
	"fps: " + string(fps),
	"wave: " + string(obj_wave_manager.wave),
	"diff: " + string(obj_wave_manager.wave_difficulty),
	"enemies: " + string(instance_number(obj_enemy)) + " (" + string(obj_wave_manager.current_spawned) + "/" + string(obj_wave_manager.wave_amount) + ")",
	"",
	"[Movement & Shooting]",
	"dir: " + string(move_direction),
	_dbg_speed_text,
	"wall_coll: " + dbg_wall_collision,
	_dbg_aim_text,
	"can_shoot: " + (can_shoot ? "YES" : "NO"),
	"is_shooting: " + (shoot_ocurring ? "YES" : "NO"),
	"",
	"[Knockback]",
	"kb_speed: " + string(knockback_speed),
	"kb_direction: " + string(knockback_direction),
	"",
	"[Inventory]",
	"life: " + string(life),
	"keys: " + string(keys),
	"points: " + string(points),
	"",
	"[Alarms]",
	"Reactivate Shooting: " + string(alarm[shoot_alarm]),
];

draw_set_halign(fa_left);
for (var _i = 0; _i < array_length(_dbg_texts); _i++) {
	if (string_char_at(_dbg_texts[_i], 0) == "[") draw_set_color(c_lime);
	else draw_set_color(c_white);
	
	draw_text(
		dbg_x_offset,
		dbg_initial_y + (_i * dbg_y_offset),
		_dbg_texts[_i]
	);
}