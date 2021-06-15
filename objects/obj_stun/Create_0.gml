/// @description Play a sound!

if (!global.muteSound && !audio_is_playing(snd_stun)) {
	audio_play_sound(snd_stun,10,false);
}