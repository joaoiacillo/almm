/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (damaged) {
	image_alpha -= 0.1;
}

if (image_alpha <= 0) {
	instance_destroy();
}
