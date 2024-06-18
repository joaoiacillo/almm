blinked++;
visible = !visible;
if (blinked >= total_blink) {
	instance_destroy();
}
alarm[1] = 5;