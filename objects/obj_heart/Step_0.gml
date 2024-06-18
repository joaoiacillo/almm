if (state == "shaking") {
	x = base_x + random_range(-0.5, 0.5);
	y = base_y + random_range(-0.5, 0.5);
}

if (state == "increase") {
	image_xscale = lerp(image_xscale, target_scale, 0.1);
	image_yscale = lerp(image_yscale, target_scale, 0.1);
}