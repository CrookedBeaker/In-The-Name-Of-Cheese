/// @description Blinky

if !global.pause {
	image_alpha = round(1-(obj_player.invincible%4/3));
} else {
	image_alpha = 1;
}

if sprite_index != -1 {draw_self()};