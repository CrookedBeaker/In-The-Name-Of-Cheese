/// @description Blinky and charging bar

//if !global.pause {
//	image_alpha = round(1-(obj_player.invincible%4/3));
//} else {
//	image_alpha = 1;
//}

if sprite_index != -1 {draw_self()};

//Charging bar
var c_mp = make_color_rgb(56,55,188);

var xMod = (direction > 270 || direction < 90) ? -32 : 44;

if charge != 0 {
	draw_sprite(spr_ui_chargebar,0,x+xMod,y);
	draw_healthbar(x+xMod-12,y-20,x+xMod-4,y+18,(charge/chargeMax)*100,c_black,c_mp,c_mp,3,false,false);
}