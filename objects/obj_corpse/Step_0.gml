/// @description Lay there and look pretty

//Get the sprite
switch parent {
	case obj_player :
		sprite_index = spr_dead_player;
		break;
	case obj_e_rat:
		sprite_index = spr_dead_rat;
		break;
	case obj_e_guard:
	case obj_e_bowman:
		sprite_index = spr_dead_guard;
		break;
	case obj_e_soldier:
		sprite_index = spr_dead_soldier;
		break;
	case obj_e_wizard:
		sprite_index = spr_dead_wizard;
		break;
	default:
		sprite_index = spr_dead_armor;
		break;
}

//Make sure you're not in any walls
while place_meeting(x,y,obj_collision) && tries != 0 {
	image_angle++;
	tries--;
}

direction = image_angle;