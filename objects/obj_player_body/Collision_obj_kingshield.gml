/// @description Get knocked back!
var i = other.image_angle

with obj_player {
	knockback = 20;
	knockbackDir = i;
}

if !global.muteSound && !audio_is_playing(snd_shieldhit) {
	audio_play_sound(snd_shieldhit,10,false);
}