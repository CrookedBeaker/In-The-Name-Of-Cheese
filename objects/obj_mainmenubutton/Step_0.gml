/// @description Animate!

image_index = (mouse_check_button(mb_left) && position_meeting(mouse_x, mouse_y, self));

if image_alpha < 1 {
	image_alpha += 1/30;
}