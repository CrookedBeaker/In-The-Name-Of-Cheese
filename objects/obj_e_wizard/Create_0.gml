/// @description Get this man ready

// Inherit the parent event
event_inherited();

GoIdle(irandom_range(60,120));

pDir = 0;

//Set this instance as the parent obj for body and legs
//if NoIdForP(obj_e_guard_body) { //Make a new one
	body = instance_create_depth(x,y,depth+1,obj_e_wizard_body);
	body.p = id;
	body.direction = direction;
	body.image_angle = image_angle;
//} else { //Retrieve existing
//	body = GetIdForP(obj_e_guard_body);
//}

shot = false;

spd = 0;
dir = 0;

//Initialize local functions
function InActiveArea() {
	return ((x > activeArea[0]) && (x < activeArea[2]) && (y > activeArea[1]) && (y < activeArea[3]));
}

function Warp(wX,wY) {
	instance_create_depth(x,y,-1,obj_poof);
	x = wX;
	y = wY;
	body.x = wX;
	body.y = wY;
	instance_create_depth(x,y,-1,obj_poof);
}