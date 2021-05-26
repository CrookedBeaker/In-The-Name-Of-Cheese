/// @description Reflect!

if pproj {
	var dir = instance_exists(obj_player) ? point_direction(x,y,obj_player.x,obj_player.y) : other.image_angle;
	
	MakeProjectile(x,y,depth,dir,spd+1,dmg,sprite_index,fire);
	instance_destroy();

	if !global.muteSound && !audio_is_playing(snd_shieldhit) {
		audio_play_sound(snd_shieldhit,10,false);
	}
} else {
	instance_destroy();
}