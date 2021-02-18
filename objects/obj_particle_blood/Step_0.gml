/// @description Shmove

image_angle += turn;

image_xscale = lerp(image_xscale,0,0.15);
image_yscale = image_xscale;

if image_xscale <= 0 {instance_destroy()}