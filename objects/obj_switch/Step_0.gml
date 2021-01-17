/// @description Ping!

if IsAttacked() {
	image_index++;
	global.pause = true;
	global.pauseDisable = true;
	
	CameraShortFocus(target);
}