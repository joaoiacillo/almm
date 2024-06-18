if (state == "increase") {
	audio_play_sound(snd_player_ded, 0, false);
	audio_play_sound(snd_laugh, 0, false);
	image_index = 1;
	cur_text = "just kidding :D";
	alarm[3] = 200;
	state = "normal";
	image_xscale = 0.5;
	image_yscale = 0.5;
	obj_dog.visible = false;
	return;
}

if (image_index != 0) {
	audio_play_sound(snd_recover, 0, false);
	image_index = 0;
	alarm[2] = 100;
} else {
	state = "increase";
	cur_text = "";
	audio_play_sound(snd_dumbvictory, 0, false);
	alarm[2] = 200;
}