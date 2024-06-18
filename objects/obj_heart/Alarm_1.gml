state = "shaking";

if (text_idx < string_length(final_text)) {
	text_idx++;
	cur_text += string_char_at(final_text, text_idx);
	audio_play_sound(snd_chug, 0, false);
	alarm[1] = 5;
} else {
	alarm[2] = 80;
}