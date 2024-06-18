var _temp_color  = draw_get_color();

draw_self();
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_pixelify_22);
draw_set_color(c_black);
draw_text_transformed(x, y - 5, text, scale - 1, scale - 1, 0);

draw_set_color(_temp_color);