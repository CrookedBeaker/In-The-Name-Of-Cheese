/// @description No, you bounce off!!!

with obj_player {
	knockback = 20;
	knockbackDir = point_direction(other.x,other.y,x,y);
	
	if !global.muteSound && !audio_is_playing(snd_shieldhit) {
		audio_play_sound(snd_shieldhit,10,false);
	}
}