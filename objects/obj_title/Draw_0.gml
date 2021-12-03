/// @description Draw it!

draw_sprite(spr_title_bg,0,320,240);
draw_sprite(spr_title_castle,0,320,240);
draw_sprite(spr_title_eric,0,320,240);

draw_set_font(fnt_ui);
draw_set_color(c_gray);
draw_text(472,462,"Version 1.0.3");
draw_set_color(c_white);
draw_text(472,460,"Version 1.0.3");
draw_self();