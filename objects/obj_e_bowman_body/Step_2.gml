/// @description Copy states, do what is necessary
if !global.pause {

if instance_exists(obj_player) {

state = p.state;
x = p.x;
y = p.y;
depth = p.depth+1;

image_speed = 1;
mask_index = spr_pix; //Remove hitbox woo

if p.knockback = 0 { //Only change states 
	switch state {
		case "idle":
			sprite_index = spr_e_bowman_body_idle;
			image_angle = p.image_angle;
			break;
		case "turn":
			sprite_index = spr_e_bowman_body_idle;
			image_angle = p.startDir; //Remain static, only turn 
			break;
		case "chase":
			sprite_index = spr_e_bowman_body_chase;
			image_angle = p.image_angle; //NOW WE'RE MOVING
			break;
		case "attack":
			sprite_index = spr_e_bowman_body_shoot;
			image_angle = p.image_angle; //Face the player
			
			//Shooting the arrow is in here just because.
			if (floor(image_index) >= 8 && !p.shot) {
				//Calculate the modifiers for getting the arrow to appear from the bow
				var r = point_distance(0,0,43,17);
				var a = -(image_angle+point_direction(0,0,43,17));
				var xMod = r*dcos(a);
				var yMod = r*dsin(a);
				
				MakeProjectile(
					x+xMod,
					y+yMod,
					depth-1,
					point_direction(x+xMod,y+yMod,obj_player.x,obj_player.y),
					5,
					2+atkMod*2,
					spr_arrow,
					false
				);
				
				p.shot = true;
				
				if (!global.muteSound && !audio_is_playing(snd_bow)) {
					audio_play_sound(snd_bow,10,false);
				}
			}
	}
	
	//Rotate
	//image_angle = direction;
} else { //Once attacked, revert to chase state
	image_speed = 0;
	if state = "attack" {
		state = "chase";
		p.state = "chase";
	}
}

} else {
	state = "idle";
	sprite_index = spr_e_bowman_body_idle;
	image_angle = p.image_angle;
}

} else {
	image_speed = 0;
}