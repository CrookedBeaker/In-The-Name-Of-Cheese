/// @description Conjuration!

if (!global.muteSound && !audio_is_playing(snd_shieldconjure)) {
	audio_play_sound(snd_shieldconjure,10,false);
}