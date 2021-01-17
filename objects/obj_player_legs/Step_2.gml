/// @description Move with the rest of the body
if !global.pause {
image_speed = 1;

//Face the mouse
//direction = point_direction(x,y,mouse_x,mouse_y);
direction = obj_player.dir
image_angle = direction;

//Move it
x = obj_player.x;
y = obj_player.y;

if obj_player.spd != 0 && obj_player.knockback = 0 { 
	sprite_index = spr_player_legs_walk;
} else {
	sprite_index = -1;
	image_index = 0;
}

} else { //Paused
	image_speed = 0;
}