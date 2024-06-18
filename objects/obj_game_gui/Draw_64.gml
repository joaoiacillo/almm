////////////////////////////////////////////////////////////////////////
#region Health Bar Drawing

draw_sprite_ext(spr_health_bar_filler_red, 0, health_bar_x + 21, health_bar_y, hb_filler_red_xscale, health_bar_scale, 0, c_white, 1);
draw_sprite_ext(spr_health_bar_filler, 0, health_bar_x + 21, health_bar_y, hb_filler_xscale, health_bar_scale, 0, c_white, 1);
draw_sprite_ext(spr_health_bar, 0, health_bar_x + 21, health_bar_y, health_bar_scale, health_bar_scale, 0, c_white, 1);

draw_set_color(make_color_rgb(0, 28, 64));
draw_circle(health_bar_x-1, health_bar_y-2, 28, false);
draw_set_color(c_white);
draw_circle(health_bar_x-1, health_bar_y-2, 25, false);
draw_sprite_ext(spr_heart, 0, health_bar_x, health_bar_y, health_bar_scale - 1, health_bar_scale - 1, 0, c_white, 1);


#endregion

////////////////////////////////////////////////////////////////////////
#region Items Drawing

if (obj_player.weapon && obj_player.weapon.name == "flute")
{
	draw_sprite_ext(spr_display_flute, 0, items_x, items_y, 2, 2, 0, c_white, 1);
}

draw_sprite_ext(spr_current_weapon_frame, 0, items_x, items_y, 2, 2, 0, c_white, 1);

if (obj_player.weapon)
{
	draw_set_font(fnt_pixelify);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_text(items_x + 50, items_y, "Firerate: " + string(obj_player.firerate));
	draw_text(items_x + 50, items_y + 30, "RMB Hability: " + (obj_player.can_heal ? "Ready!" : "Recharding..."));
}

#endregion

////////////////////////////////////////////////////////////////////////
#region Points Drawing

var _temp_font = draw_get_font();
var _temp_color = draw_get_color();

draw_set_font(fnt_pixelify_22);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);

if (obj_wave_manager.is_boss_battle) {
	draw_set_color(c_grey);
}

draw_text_transformed(
	window_get_width() - 30, 40,
	string(obj_player.points),
	points_scale, points_scale,
	points_angle
);

#endregion

////////////////////////////////////////////////////////////////////////
#region Wave Display Drawing

var _x = window_get_width() / 2;
var _color = c_white;

switch (obj_wave_manager.wave_difficulty)
{
	case WAVE_DIFFICULTIES.MEDIUM:
		_color = c_orange;
		break;
}

draw_set_color(c_white);
if (obj_player.weapon)
{
	draw_sprite_ext(spr_wave_display, 0, _x, 50, 2, 2, 0, _color, 1);
	draw_set_color(c_black);
}

draw_set_halign(fa_center);
draw_set_font(fnt_pixelify_20);

if (obj_player.weapon)
{
	draw_text(_x, 50, "Wave " + string(max(obj_wave_manager.wave, 1)));
}
else {
	draw_text(_x, 50, "Grab your flute!");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(_temp_font);
draw_set_color(_temp_color);

#endregion
