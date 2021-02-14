/// @description Move the player if necessary

image_alpha = 0;

if global.prevRoom = target {
	obj_player.x = x+(16*image_xscale)+pOffsetX;
	obj_player.y = y+(16*image_yscale)+pOffsetY;
}