/// @description Copy states, do what is necessary
if !global.pause {
image_speed = 1;

state = p.state;
x = p.x;
y = p.y;
depth = p.depth+1;

switch state {
	case "idle":
	case "turn":
		sprite_index = spr_e_guard_body_idle;
		mask_index = spr_pix; //Remove hitbox woo
		direction = p.startDir; //Remain static, only turn head
		break;
	case "chase":
		sprite_index = spr_e_guard_body_chase;
		mask_index = spr_pix; //Remove hitbox woo
		direction = p.direction; //NOW WE'RE MOVING
		break;
	case "attack":
		sprite_index = spr_e_guard_body_stab;
		mask_index = sprite_index;
		direction = p.direction; //Stabby
}

//Rotate
image_angle = direction;

} else {
	//if !instance_exists(p) {instance_destroy()}
	image_speed = 0;
}