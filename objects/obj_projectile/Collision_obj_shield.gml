/// @description Reflect!

if !pproj {
	var inst = MakeProjectile(x,y,depth,point_direction(x,y,mouse_x,mouse_y),spd+1,dmg,sprite_index,fire);
	inst.pproj = true;
	instance_destroy();
	
	if !global.muteSound && !audio_is_playing(snd_shieldhit) {
		audio_play_sound(snd_shieldhit,10,false);
	}
}