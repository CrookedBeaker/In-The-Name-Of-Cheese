/// @description Check for mute

if (global.muteMusic) {
	audio_pause_sound(song);
}

//Account for a delay
if delay != 0 {
	delay--;
	if delay = 0 {
		var loop = !(song = mus_intro || song = mus_sewerend || song = mus_dhallcs || song = mus_escape || song = mus_credits);
		audio_play_sound(song,9,loop);
	}
}