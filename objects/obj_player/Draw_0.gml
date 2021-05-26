/// @description Draw a crosshair

draw_sprite(spr_crosshair,0,mouse_x,mouse_y);

if !global.pause {
	image_alpha = 1-(invincible%4/3);
} else {
	image_alpha = 1;
}

draw_self();