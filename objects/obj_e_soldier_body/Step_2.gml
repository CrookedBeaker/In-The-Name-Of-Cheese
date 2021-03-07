/// @description Copy states, do what is necessary
if !global.pause {

state = p.state;
x = p.x;
y = p.y;
depth = p.depth+1;

image_speed = 1;

if p.knockback = 0 { //Only change states 
	switch state {
		case "idle":
			if !instance_exists(obj_player) {
				sprite_index = p.armor ? spr_e_armor_body_idle : spr_e_soldier_body_idle;
			}
			mask_index = spr_pix; //Remove hitbox woo
			direction = p.direction;
			break;
		case "turn":
			sprite_index = p.armor ? spr_e_armor_body_idle : spr_e_soldier_body_idle;
			mask_index = spr_pix; //Remove hitbox woo
			direction = p.startDir; //Remain static, only turn 
			break;
		case "chase":
			sprite_index = p.armor ? spr_e_armor_body_chase : spr_e_soldier_body_chase;
			mask_index = spr_pix; //Remove hitbox woo
			direction = p.direction; //NOW WE'RE MOVING
			break;
		case "attack":
			sprite_index = p.armor ? spr_e_armor_body_stab : spr_e_soldier_body_stab;
			mask_index = sprite_index;
			direction = p.direction; //Stabby
	}
	
	//Rotate
	image_angle = direction;
} else { //Once attacked, revert to chase state
	image_speed = (sprite_index = spr_e_soldier_shock);
	
	//Update sprite accordingly if armor is removed
	if !p.armor {
		if sprite_index = spr_e_armor_body_idle {sprite_index = spr_e_soldier_body_idle};
		if sprite_index = spr_e_armor_body_chase {sprite_index = spr_e_soldier_body_chase};
		if sprite_index = spr_e_armor_body_stab {sprite_index = spr_e_soldier_body_stab};
	}
	
	if state = "attack" {
		state = "chase";
		p.state = "chase";
	}
}

} else {
	image_speed = 0;
}