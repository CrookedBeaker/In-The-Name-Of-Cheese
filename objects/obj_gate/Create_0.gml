/// @description Add some stuff!

// Inherit the parent event
event_inherited();

direction = image_angle;

function activate() { //Override!
	image_index++;
	active = false;
	
	Screenshake(20,8);
}

//Determine sprite to use
switch room {
	//Ones for sewer is set by default
	case rm_wall_1: //Castle wall
	case rm_wall_2:
	case rm_wall_4:
		sprite_index = spr_gate_tower;
		break;
	case rm_dungeon_1: //Dungeon
	case rm_dungeon_2:
	case rm_dungeon_3:
		sprite_index = spr_gate_dungeon;
		break;
}