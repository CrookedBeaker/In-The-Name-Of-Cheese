/// @description Add some stuff!

// Inherit the parent event
event_inherited();

direction = image_angle;

function activate() { //Override!
	image_index++;
	active = false;
	
	if !global.muteSound { //Play us a sound!
		audio_play_sound(snd_gate,10,false);
	}
	
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
	case rm_library_1: //Library
	case rm_library_2:
	case rm_library_3:
	case rm_library_4:
		sprite_index = spr_gate_library;
		break;
	case rm_barracks_1: //Barracks
	case rm_barracks_2:
		sprite_index = spr_gate_barracks;
		break;
}