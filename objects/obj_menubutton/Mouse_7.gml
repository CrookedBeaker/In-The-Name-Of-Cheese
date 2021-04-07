/// @description Do the thing

if room = rm_title { //Message the title sub-menu
	obj_titlesubmenu.select = ind;
} else { //Message the pause menu
	obj_escmenu.select = ind;
}

audio_play_sound(snd_button,10,false);