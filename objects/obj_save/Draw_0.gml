/// @description Make some text

draw_set_font(fnt_ui);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

draw_set_color(c_gray);
draw_text(x,y,"Game Saved!");

draw_set_color(c_white);
draw_text(x,y-2,"Game Saved!");

draw_set_halign(fa_left);
draw_set_valign(fa_top);