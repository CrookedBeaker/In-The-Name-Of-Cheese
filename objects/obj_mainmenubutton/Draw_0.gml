/// @description Text?

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_ui);
draw_set_color(c_black);
draw_set_alpha(image_alpha);

draw_text(x,y+2+2*image_index,label);

draw_set_alpha(1);