/// @description ROLL 'EM!

drawY-=0.5;

if (drawY < -1100 || keyboard_check_pressed(vk_enter)) {
	Transition(rm_intro,seq_fadeout,seq_fadein);
}