/// @description Ping!

if (IsAttacked() || hit) && image_index = 0 {
	image_index++;
	global.pause = true;
	global.pauseDisable = true;
	
	instance_create_depth(x,y,depth-1,obj_break);
	
	CameraShortFocus(target);
	
	if (!global.muteSound && !audio_is_playing(snd_switch)) {
		audio_play_sound(snd_switch,10,false);
	}
}