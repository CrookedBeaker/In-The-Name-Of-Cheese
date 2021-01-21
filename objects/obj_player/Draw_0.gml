/// @description Draw a crosshair

draw_sprite(spr_crosshair,0,mouse_x,mouse_y);

if !global.pause {
	image_alpha = (1-invincible%2);
} else {
	image_alpha = 1;
}

draw_self();

if burn > 0 {draw_sprite(spr_burning,floor(burn/10),x,y)}