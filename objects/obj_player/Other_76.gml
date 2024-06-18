var _foot = undefined;

if (event_data[? "message"] == "player_foot_right") {
	_foot = "right";
}

if (event_data[? "message"] == "player_foot_left") {
	_foot = "left";
}

if (_foot != undefined && is_leaving_blood_trail) {
	var _inst = instance_create_layer(x, y, "Effects", obj_blood_trail);
	_inst.image_index = _foot == "left" ? 0 : 1;
}