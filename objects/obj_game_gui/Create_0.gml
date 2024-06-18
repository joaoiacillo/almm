////////////////////////////////////////////////////////////////////////
#region Health Bar Variables


health_bar_scale = 3;

health_bar_x = 50;
health_bar_y = 40;

target_hb_filler_xscale = obj_player.life * health_bar_scale / 100 - 0.5;

hb_filler_xscale = target_hb_filler_xscale;
hb_filler_red_xscale = hb_filler_xscale;

#endregion

////////////////////////////////////////////////////////////////////////
#region Items Variables

items_x = 60;
items_y = window_get_height() - 60;

#endregion

////////////////////////////////////////////////////////////////////////
#region Points Variables

points_target_scale = 1;
points_scale = points_target_scale;

points_target_angle = 0;
points_angle = points_target_angle;

#endregion