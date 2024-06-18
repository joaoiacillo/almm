function Weapon() constructor
{
	name = "none";
	knockback = 0;
	knockback_multiplier = 0;
	sprite = undefined;
	projectile = noone;
	shoot_sounds = [];
	
	play_shoot_sound = function ()
	{
		static _max = array_length(shoot_sounds) - 1;
		if (_max < 0) return;
		audio_play_sound(shoot_sounds[irandom(_max)], 0, false);
	}
	
	shoot = function (_x, _y, _dir)
	{
		if (projectile == noone)
		{
			throw ("Weapon doesn't have a projectile!");
		}
		
		var _projectile = instance_create_layer(_x, _y, "Bullets", projectile);
		play_shoot_sound();
		
		with (_projectile)
		{
			image_angle = _dir;
			image_xscale = 0.5;
			image_yscale = 0.5;
		}
		
		return _projectile;
	}
	
	draw = function (_x, _y, _dir)
	{
		if (sprite == undefined)
		{
			throw ("Weapon doesn't have an sprite!");
		}
		
		draw_sprite_ext(
			sprite, 0,
			_x, _y,
			0.6, 0.6,
			_dir, c_white, 1
		);
	}
}

function Flute() : Weapon() constructor
{
	name = "flute";
	knockback = 3;
	knockback_multiplier = 0.2;
	projectile = obj_note_projectile;
	sprite = spr_flute;
	shoot_sounds = [snd_flute_c2, snd_flute_c3, snd_flute_d2];
}
