#region Movement Variables

// The base damage. May be influenced by heavy shots.
damage = 15;

// This is equivelent to an entity health. If the projectile durability
// falls all the way to 0, it is destroyed. May be influenced by heavy
// shots.
// Every time the projectile hits an enemy, it's durability is reduced
// by the amount of life that the entity has. Which means that the
// projectile will be able to continue it's trajectory after the enemy's
// life is reduced.
durability = 30;

velocity = 4;

#endregion

__projectile_ded_base = function ()
{
	audio_play_sound(snd_projectile_collision, 0, false);
}

projectile_ded = function ()
{
	__projectile_ded_base();
	instance_change(obj_projectile_explosion, false);
	image_speed = 1;
}