/// @description Play some music!
if (!audio_is_playing(song)) {

//Stop all music!
audio_stop_sound(mus_castlewall);
audio_stop_sound(mus_dungeon);
audio_stop_sound(mus_mainhall);
audio_stop_sound(mus_sewers);

if (song != noone) { //Play the song!
	audio_play_sound(song,9,true);
}

//if (!global.muteMusic) {audio_resume_all()}; //Resume paused audio

}