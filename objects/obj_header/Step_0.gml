/// @description Handle stuff

if global.pause || global.transition {
	timeline_running = false;
} else {
	timeline_running = true;
	
	image_alpha += fade/120;
}