/// @description Setter ablaze!~

if other.fire {
	//Set sprite
	
	global.pause = true;
	global.pauseDisable = true;
	
	instance_destroy(other);
	CameraShortFocus(target);
}