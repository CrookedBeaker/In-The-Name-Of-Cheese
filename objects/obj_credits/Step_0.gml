/// @description ROLL 'EM!

drawY-=0.5;

if (drawY < -1100 || keyboard_check_pressed(vk_enter)) {
	Transition(GMFileExists() ? rm_intro : rm_unlock,seq_fadeout,seq_fadein);
}