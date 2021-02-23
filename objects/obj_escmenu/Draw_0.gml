/// @description What

draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_self();

draw_set_color(make_color_rgb(50,19,0));
draw_text(x+1,y-90,mLabel);

draw_set_color(c_black);
draw_text(x,y-91,mLabel);

//Extra text
draw_set_alpha(tAlpha);
draw_set_color(c_white);

draw_text(x,y-120,tLabel);

draw_set_alpha(1);
draw_set_color(make_color_rgb(50,19,0));