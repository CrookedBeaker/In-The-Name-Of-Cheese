/// @description Hell yeah, credits!

draw_self();
draw_sprite(spr_title_logo,0,x+160,y+drawY);

draw_set_font(fnt_ui);
draw_set_color(c_gray);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(x+160,y+drawY+80,"Credits");

draw_text(x+160,y+drawY+160,"\n\nViolet Vujs\naka \"Crooked Beaker\""+
	"\n\n\n"+
	"\nJared Riley"+
	"\n\n\n"+
	"\nNickolai Filipanov\naka \"RetroeyDoofery\""+
	"\n\n\n\n"+
	"TsunamiCoRyan"+
	"\n\n\n"+
	"\nAdigun Azikiwe Polack"+
	"\n\n\n"+
	"Thank you for playing!!!");

draw_set_font(fnt_credits);

draw_text(x+160,y+drawY+160,"Developed, programmed,\nand illustrated by\n\n"+
	"\n\n\n"+
	"Music by\n"+
	"\n\n\n"+
	"Sound effects by\n"+
	"\n\n\n\n"+
	"Additional art by\n"+
	"\n\n\n"+
	"\"Irishalini\" typeface by\n"+
	"\n\n\n"+
	"");


draw_set_font(fnt_ui);
draw_set_color(c_white);
draw_text(x+160,y+drawY+158,"\n\nViolet Vujs\naka \"Crooked Beaker\""+
	"\n\n\n"+
	"\nJared Riley"+
	"\n\n\n"+
	"\nNickolai Filipanov\naka \"RetroeyDoofery\""+
	"\n\n\n\n"+
	"TsunamiCoRyan"+
	"\n\n\n"+
	"\nAdigun Azikiwe Polack"+
	"\n\n\n"+
	"Thank you for playing!!!");