/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

target_velocity = calc_target_velocity();
velocity = lerp(velocity, target_velocity, 0.3);
