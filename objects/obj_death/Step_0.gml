/// @description You're died!

x = obj_camera.x;
y = obj_camera.y-32;

if (image_alpha < 1) {
	image_alpha += 1/120;
}

if instance_exists(obj_escmenu) || global.transition {image_alpha = 0}

fadex1 = x+irandom_range(-2,2);
fadey1 = y+irandom_range(-2,2);
fadex2 = x+irandom_range(-4,4);
fadey2 = y+irandom_range(-4,4);