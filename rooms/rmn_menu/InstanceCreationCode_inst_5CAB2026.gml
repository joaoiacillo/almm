text = "Exit";
confirm = false;

on_custom_alarm = function () {
	text = "Exit";
	confirm = false;
}

on_click = function () {
	if (confirm) game_end();
	confirm = true;
	text = "Really? :[";
	set_custom_alarm(150);
	//alarm[custom_alarm] = 100;
}