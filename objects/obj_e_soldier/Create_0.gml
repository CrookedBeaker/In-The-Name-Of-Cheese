/// @description Get this man ready

// Inherit the parent event
event_inherited();

direction = startDir;
image_angle = startDir;
pDir = 0;

//Set this instance as the parent obj for body and legs
//if NoIdForP(obj_e_guard_body) { //Make a new one
	body = instance_create_depth(x,y,depth+1,obj_e_soldier_body);
	body.p = id;
	body.direction = direction;
	body.image_angle = image_angle;
//} else { //Retrieve existing
//	body = GetIdForP(obj_e_guard_body);
//}

//if NoIdForP(obj_e_guard_legs) { //Make a new one
	legs = instance_create_depth(x,y,depth+2,obj_e_guard_legs);
	legs.p = id;
//} else { //Retrieve existing
//	legs = GetIdForP(obj_e_guard_legs);
//}

/*
//Put in the loaded variables if applicable
if variable_instance_exists(id,"body_image_index") {
	body.image_index = body_image_index;
	body.sprite_index = body_sprite_index;
	body.direction = body_direction;
	body.depth = body_depth;
	legs.image_index = legs_image_index;
	legs.sprite_index = legs_sprite_index;
	legs.direction = legs_direction;
	legs.depth = legs_depth;
}
*/

spd = 0;
dir = 0;

if targetDir != -1 { //Protect against saving
	targetDir = (irandom(1) = 0) ? startDir+45 : startDir-45;
}