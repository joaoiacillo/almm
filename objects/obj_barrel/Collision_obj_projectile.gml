if (regen || image_alpha < 0.8) return;

var _inst = instance_create_layer(x, y, "Explosions", obj_explosion, {
	by_player: true
});

regen = true;
image_alpha = 0;
x = base_x + irandom_range(-8, 8);
y = base_y + irandom_range(-8, 8);
alarm[0] = irandom_range(600, 1200);