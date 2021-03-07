/// @description Draw it
draw_set_alpha(image_alpha);

draw_sprite(spr_ui_header,0,640,72);

draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_set_font(fnt_ui);
draw_set_color(c_white);
draw_text(528+(image_alpha*96),96,label);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);