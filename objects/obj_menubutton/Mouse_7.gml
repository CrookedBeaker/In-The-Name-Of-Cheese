/// @description Do the thing

if room = rm_title { //Message the title sub-menu
	obj_titlesubmenu.select = ind;
} else { //Message the pause menu
	obj_escmenu.select = ind;
}

if !global.muteSound {
	var s = back ? snd_button_back : snd_button_confirm;
	audio_play_sound(s,10,false);
}