/// @description Correct yourself upon room entry
depth = obj_player_body.depth;

if instance_exists(obj_player) {
	//Face the mouse
	if obj_player.knockback = 0 && !(sprite_index = spr_player_body_stab || sprite_index = spr_player_body_cast){
		direction = point_direction(x,y,mouse_x,mouse_y);
		image_angle = direction;
	}
	
	//Move it
	x = obj_player.x;
	y = obj_player.y;
}