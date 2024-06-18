draw_self();

draw_set_font(fnt_pixelify);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(x, y - 15, "Flute", 0.3, 0.3, 0);

draw_circle(x, y, 8, true);
