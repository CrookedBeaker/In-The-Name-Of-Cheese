/// @description Blinky/Statuses

if !global.pause {
	image_alpha = 1-(invincible%4/3);
} else {
	image_alpha = 1;
}

draw_self();

if burn > 0 {draw_sprite(spr_burning,floor(burn/10),x,y)}
if stunned {draw_sprite(spr_stunned,floor(idleWait/10),x,y)}