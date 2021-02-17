///For buttons
function MultiInput(keyboard,controller,pressed) {
	var i = 0;
	
	if pressed {
		i += keyboard_check_pressed(keyboard);
		i += gamepad_button_check_pressed(0,controller);
	} else {
		i += keyboard_check(keyboard);
		i += gamepad_button_check(0,controller);
	}
	
	return sign(i);
}

///For sticks
function MultiInputStickDigital(keyboard,axis,neg,pressed) {
	var i = 0;
	
	if pressed {
		i += keyboard_check_pressed(keyboard);
		//i += gamepad_button_check_pressed(0,controller);
	} else {
		i += keyboard_check(keyboard);
		if neg = 0 {neg = -1}
		ax = gamepad_axis_value(0,axis)*(-neg);
		if ax > 0 {
			i += ax;
		}
	}
	
	return sign(i);
}