event_inherited();

image_speed = 0;
image_index = irandom(sprite_get_number(spr_note_projectile) - 1);

image_alpha = 1;

damaged = false;

projectile_ded = function ()
{
	if (damaged) return;
	__projectile_ded_base();
	damage = 0;
	damaged = true;
}