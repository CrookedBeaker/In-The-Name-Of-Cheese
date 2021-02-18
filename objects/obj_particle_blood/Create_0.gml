/// @description Random stuff!

image_angle = irandom(360);
direction = irandom(360);
image_xscale = irandom_range(2,4);
image_yscale = image_xscale;

spd = irandom_range(1,4);
turn = irandom_range(1,8);

motion_set(direction,spd);