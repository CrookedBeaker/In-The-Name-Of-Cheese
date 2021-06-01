/// @description Setter ablaze!~

if (other.fire || other.sprite_index = spr_bullet) && sprite_index != spr_torch_lit {
	sprite_index = spr_torch_lit;
	
	global.pause = true;
	global.pauseDisable = true;
	
	audio_play_sound(snd_burn,10,false);
	
	instance_destroy(other);
	CameraShortFocus(target);
}