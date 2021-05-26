/// @description Draw it!

draw_set_alpha(image_alpha);
draw_self();

draw_set_alpha(image_alpha*0.5);
draw_sprite(spr_ui_death_fade,0,fadex2,fadey2);

draw_set_alpha(image_alpha*0.7);
draw_sprite(spr_ui_death_fade,0,fadex1,fadey1);

draw_set_alpha(image_alpha);
draw_sprite(spr_ui_death_fade,0,x,y);

draw_set_alpha(1);