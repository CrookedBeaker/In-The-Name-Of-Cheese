/// @description Draw a funny number :3
draw_set_font(fnt_ui);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var s = strUp ? "Strength Up!" : "Level Up!";
var c = strUp ? c_orange : c_yellow;

draw_set_color(c_dkgray);

draw_text_transformed(x+2,y+2,s,xScale,yScale,0);

draw_set_color(c);

draw_text_transformed(x,y,s,xScale,yScale,0);