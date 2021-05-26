/// @description Copy states, do what is necessary
if !global.pause {

if instance_exists(obj_player) {

state = p.state;
x = p.x;
y = p.y;
depth = p.depth+1;

image_speed = 1;
//mask_index = spr_pix; //Remove hitbox woo

if p.knockback = 0 { //Only change states 
	image_angle = p.image_angle;
	
	switch state {
		case "idle":
		case "hide":
		case "appear":
			sprite_index = spr_e_wizard_body_idle;
			break;
		case "charge":
			sprite_index = spr_e_wizard_body_charge;
			break;
		case "attack":
			sprite_index = spr_e_wizard_body_cast;
			
			//Casting the spell is in here just because.
			if (floor(image_index) >= 1 && !p.shot) {
				//Calculate the modifiers for getting the fireball to appear from the blast
				var r = 32;
				var a = -(image_angle);
				var xMod = r*dcos(a);
				var yMod = r*dsin(a);
				
				MakeProjectile(
					x+xMod,
					y+yMod,
					depth-1,
					point_direction(x+xMod,y+yMod,obj_player.x,obj_player.y),
					5,
					1+atkMod,
					spr_fire,
					true
				);
				
				p.shot = true;
			}
	}
	
	//Rotate
	//image_angle = direction;
} else { //Once attacked, revert to hiding state if not stunned
	if !p.stunned {
		image_speed = 0;
		state = "hide";
		p.state = "hide";
	}
}

} else {
	state = "idle";
	sprite_index = spr_e_wizard_body_idle;
	image_angle = p.image_angle;
}

} else {
	image_speed = 0;
}