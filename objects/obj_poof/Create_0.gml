/// @description Poof!

if (!global.muteSound && !audio_is_playing(snd_poof)) {
	audio_play_sound(snd_poof,10,false);
}