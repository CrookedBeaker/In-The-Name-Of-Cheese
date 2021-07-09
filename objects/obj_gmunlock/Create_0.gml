/// @description Set the alarm and play a sound?

alarm[0] = 300;
image_index = 6;

MakeGMFile(); //Unlock it!

if (!global.muteMusic) {audio_play_sound(mus_spellget,9,false)};