/// @description Stay and go

if sprite_index = spr_shield_in { //Enter!
	sprite_index = spr_shield;
} else if sprite_index = spr_shield_out { //Get rid of it
	instance_destroy();
} else if sprite_index = spr_shield_warning { //Blink a few times
	loops--;
	if loops = 0 {
		sprite_index = spr_shield;
	}
}