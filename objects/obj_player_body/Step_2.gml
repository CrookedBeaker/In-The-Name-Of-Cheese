/// @description Move with the rest of the body
if !global.pause {
	
//Face the mouse
if obj_player.knockback = 0 && !(sprite_index = spr_player_body_stab || sprite_index = spr_player_body_cast){
	direction = point_direction(x,y,mouse_x,mouse_y);
	image_angle = direction;
}

//Move it
x = obj_player.x;
y = obj_player.y;

}