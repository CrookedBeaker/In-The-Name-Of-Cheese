/// @description Animate!
var prevind = image_index;

image_index = (mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, self));

if prevind = 0 && image_index = 1 && !global.muteSound {
	audio_play_sound(snd_button_hover,10,false);
}