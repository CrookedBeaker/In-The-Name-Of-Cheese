/// @description Let's move
if !global.pause {
	image_speed = 1;
	motion_set(direction,spd);
} else {
	image_speed = 0;
	motion_set(direction,spd);
}

image_angle = direction;