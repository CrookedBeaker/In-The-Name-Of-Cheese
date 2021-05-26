/// @description Draw burning?

if burn > 0 {draw_sprite(spr_burning_small,floor(burn/10),x,y)}

// Inherit the parent event
event_inherited();