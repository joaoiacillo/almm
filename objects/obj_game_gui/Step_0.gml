////////////////////////////////////////////////////////////////////////
#region Health Bar

target_hb_filler_xscale = obj_player.life * health_bar_scale / 100 - 0.5;

hb_filler_xscale = lerp(hb_filler_xscale, target_hb_filler_xscale, 0.1);
hb_filler_red_xscale = lerp(hb_filler_red_xscale, target_hb_filler_xscale, 0.01);

#endregion

////////////////////////////////////////////////////////////////////////
#region Points

points_scale = lerp(points_scale, points_target_scale, 0.1);
points_angle = lerp(points_angle, points_target_angle, 0.1);

#endregion