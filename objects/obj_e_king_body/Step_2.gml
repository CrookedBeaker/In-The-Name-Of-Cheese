/// @description Copy states, do what is necessary
if !global.pause {

state = obj_e_king.state;
x = obj_e_king.x;
y = obj_e_king.y;
depth = obj_e_king.depth+1;

image_speed = 1;

switch state {
	case "idle":
		sprite_index = spr_king_body_idle;
		mask_index = spr_pix; //Remove hitbox woo
		//direction = obj_e_king.direction;
		break;
	case "slam":
		sprite_index = spr_king_body_slam;
		mask_index = spr_pix; //Remove hitbox woo
		//direction = obj_e_king.direction; //NOW WE'RE MOVING
		break;
	case "swing":
		sprite_index = spr_king_body_swing;
		mask_index = sprite_index; //Set hitbox woo
		//direction = obj_e_king.direction; //WHACK
		
		if (!global.muteSound && floor(image_index) = 3 && !sound) {
			audio_play_sound(snd_stab,10,false);
			sound = true;
		}
}

//Rotate
image_angle = direction;

} else {
	image_speed = 0;
}