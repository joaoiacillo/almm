/// @description Start Heal beat

if (life <= 0 || !weapon || weapon.name != "flute") return;

if (heal_beat != 0 || !can_heal) return;

if (obj_action_camera.follow != obj_player) return;

obj_player.weapon.play_shoot_sound();
can_heal = false;
heal_beat++;
instance_create_layer(0, 0, "Effects", obj_heal_circle);
var _inst = instance_create_layer(0, 0, "Effects", obj_healing_heart);
_inst.beat();
