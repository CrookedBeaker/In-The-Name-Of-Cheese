/// @description Fancy UI
//Actually we're doing this in the camera lol
/*
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(fnt_ui);

draw_set_color(c_teal);
draw_text(32,448,"EXP: "+string(global.pEXP)+"/"+string(global.pEXPMax));

draw_set_color(c_blue);
draw_text(32,424,"MP: "+string(global.pMP)+"/"+string(global.pMPMax));

draw_set_color(c_red);
draw_text(32,400,"HP: "+string(global.pHP)+"/"+string(global.pHPMax));

draw_set_color(c_black);
draw_text(32,376,"Level "+string(global.pLVL));

draw_set_valign(fa_top);

draw_text(32,32,"ESC - Menu");