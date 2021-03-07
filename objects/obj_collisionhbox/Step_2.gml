/// @description Collide with walls and stuff
if instance_exists(obj) {

//Line up with the object
x = obj.x;
y = obj.y;

hspd = x-xprevious;
vspd = y-yprevious;

//Very, very janky and experimental collison

if place_meeting(x+hspd,y,obj_collision) && place_meeting(x+hspd,yprevious,obj_collision) {
	if place_meeting(x,y,obj_collision) {x = xprevious};
	while !place_meeting(x+sign(hspd),y,obj_collision) {
		x+=sign(hspd);
	}
	hspd = 0;
	obj.x = x;
}

if place_meeting(x,y+vspd,obj_collision) && place_meeting(xprevious,y+vspd,obj_collision) {
	if place_meeting(x,y,obj_collision) {y = yprevious};
	while !place_meeting(x,y+sign(vspd),obj_collision) {
		y+=sign(vspd);
	}
	vspd = 0;
	obj.y = y;
}

//Other collision hitboxes!
if place_meeting(x+hspd,y,obj_collisionhbox) && place_meeting(x+hspd,yprevious,obj_collisionhbox) {
	if place_meeting(x,y,obj_collisionhbox) {x = xprevious};
	while !place_meeting(x+sign(hspd),y,obj_collisionhbox) && hspd != 0 {
		x+=sign(hspd);
	}
	hspd = 0;
	obj.x = x;
}

if place_meeting(x,y+vspd,obj_collisionhbox) && place_meeting(xprevious,y+vspd,obj_collisionhbox) {
	if place_meeting(x,y,obj_collisionhbox) {y = yprevious};
	while !place_meeting(x,y+sign(vspd),obj_collisionhbox) && vspd != 0 {
		y+=sign(vspd);
	}
	vspd = 0;
	obj.y = y;
}

} else {
	instance_destroy();
}