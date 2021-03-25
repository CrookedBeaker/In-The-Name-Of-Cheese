/// @description Move out, then towards the player
if !global.pause {
image_speed = 1;

if knockback > 0 { //Spread out!
	knockback = lerp(knockback,0,0.2);
	motion_set(knockbackDir,knockback);
} else { //Head for the player!
	if instance_exists(obj_player) {
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		motion_set(direction,spd);
		
		spd += 1/30;
	} else {
		motion_set(direction,0);
	}
}

//Get picked up
if place_meeting(x,y,obj_player) {
	instance_destroy();
	global.pEXP += val;
	
	if global.pEXP >= global.pEXPMax && global.pLVL < 10 {
		LevelUp();
	} else {
		NumParticleGain(val,c_teal);
	}
}

} else {
	motion_set(direction,0);
	image_speed = 0;
}

sprite_index = (val >= 5) ? spr_exp_large : spr_exp_small;