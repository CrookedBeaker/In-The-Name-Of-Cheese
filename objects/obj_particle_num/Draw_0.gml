/// @description Draw a funny number :3
draw_set_font(fnt_ui);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_dkgray);

draw_text_transformed(x+2,y+2,string(val),xScale,yScale,0);

var c = crit ? c_yellow : c_maroon;
draw_set_color(c);

draw_text_transformed(x,y,string(val),xScale,yScale,0);