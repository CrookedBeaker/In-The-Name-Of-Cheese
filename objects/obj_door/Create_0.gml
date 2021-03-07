/// @description Move the player if necessary

image_alpha = 0;

/*
if global.prevRoom = target {
	obj_player.x = x+(16*image_xscale)+pOffsetX;
	obj_player.y = y+(16*image_yscale)+pOffsetY;
	
	//Calculate angle for player to be at
	var dir;
	if abs(pOffsetY) > abs(pOffsetX) {
		dir = (sign(pOffsetY) = -1) ? 90 : 270;
	} else {
		dir = (sign(pOffsetX) = -1) ? 180 : 0;
	}
	
	obj_player.direction = dir;
	obj_player.image_angle = dir;
	
	obj_player_body.direction = dir;
	obj_player_body.image_angle = dir;
}