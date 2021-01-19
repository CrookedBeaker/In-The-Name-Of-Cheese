/// @description Move with the rest of the body
if !global.pause {
image_speed = 1;

//Face the mouse
//direction = point_direction(x,y,mouse_x,mouse_y);
direction = p.dir
image_angle = direction;

//Move it
x = p.x;
y = p.y;
depth = p.depth+2;

if p.spd != 0 && p.knockback = 0 { 
	sprite_index = spr_e_legs;
} else {
	sprite_index = -1;
	image_index = 0;
}

} else { //Paused
	if !instance_exists(p) {instance_destroy()}
	image_speed = 0;
}