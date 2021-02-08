/// @description Activate!

if active {activate()}

//Automatically connect with switch
if (swIns = noone && place_meeting(swX,swY,obj_switch)) {
	var X = swX;
	var Y = swY;
	var me = id;
	var sw;
	with obj_switch {
		if (x = X && y = Y) {
			target = me; //Set the focus, but only for the object at the proper coordinates
		}
		sw = id; //Reset ID to link to focus
	}
	swIns = sw; //Set the instance.
}