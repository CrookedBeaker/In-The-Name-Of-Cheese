/// @description Stay and go

if sprite_index = spr_kingshield_in { //Enter!
	sprite_index = spr_kingshield;
} else if sprite_index = spr_kingshield_out { //Get rid of it
	instance_destroy();
}