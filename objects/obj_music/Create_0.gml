/// @description Play some music!
if (!audio_is_playing(song)) {

//Stop all music!
audio_stop_sound(mus_castlewall);
audio_stop_sound(mus_dungeon);
audio_stop_sound(mus_mainhall);
audio_stop_sound(mus_sewers);
audio_stop_sound(mus_library);
audio_stop_sound(mus_barracks);
audio_stop_sound(mus_intro);
audio_stop_sound(mus_title);
audio_stop_sound(mus_dininghall);

audio_stop_sound(mus_sewerend);
audio_stop_sound(mus_dhallcs);
audio_stop_sound(mus_escape);
audio_stop_sound(mus_credits);

if (song != noone) { //Play the song!
	var loop = !(song = mus_sewerend || song = mus_dhallcs || song = mus_escape || song = mus_credits);
	audio_play_sound(song,9,loop);
}

//if (!global.muteMusic) {audio_resume_all()}; //Resume paused audio

}