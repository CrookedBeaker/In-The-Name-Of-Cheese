/// @description Add some stuff!

// Inherit the parent event
event_inherited();

direction = image_angle;

function activate() { //Override!
	image_index++;
	active = false;
	
	Screenshake(20,8);
}

//Determine sprite to use
//switch room {
	//Ones for sewer is set by default
	//Will add later
//}