/// @description Set the alarm and play a sound?

alarm[0] = 300;
obj_camera.stop = true;

audio_pause_all();

if (!global.muteMusic) {audio_play_sound(mus_spellget,9,false)};