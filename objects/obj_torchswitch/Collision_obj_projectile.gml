/// @description Setter ablaze!~

if other.fire && sprite_index != spr_torch_lit {
	sprite_index = spr_torch_lit;
	
	global.pause = true;
	global.pauseDisable = true;
	
	instance_destroy(other);
	CameraShortFocus(target);
}