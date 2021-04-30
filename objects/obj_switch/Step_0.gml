/// @description Ping!

if IsAttacked() && image_index = 0 {
	image_index++;
	global.pause = true;
	global.pauseDisable = true;
	
	instance_create_depth(x,y,depth-1,obj_break);
	
	CameraShortFocus(target);
}