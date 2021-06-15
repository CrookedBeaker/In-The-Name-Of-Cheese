/// @description Move with the rest of the body
if !global.pause {

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

lifetime--;
if lifetime = 180 {sprite_index = spr_shield_warning}
if lifetime = 0 {
	if (!global.muteSound && !audio_is_playing(snd_shieldbreak)) {
		audio_play_sound(snd_shieldbreak,10,false);
	}
	
	sprite_index = spr_shield_out
}

}