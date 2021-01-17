/// @description Stay and go

if sprite_index = spr_shield_in {
	sprite_index = spr_shield;
} else if sprite_index = spr_shield_out {
	instance_destroy();
}