/// @description Stab and stuff
if !global.pause {
image_speed = 1;

if !attacking {
	if mouse_check_button_pressed(mb_left) {
		image_index = 0;
		sprite_index = spr_player_body_stab;
		attacking = true;
		
		if !global.muteSound { //Play us a sound!
			audio_play_sound(snd_stab,10,false);
		}
	} else if mouse_check_button_pressed(mb_right) && global.pMP >= cost && global.spells[global.spellSelect] && !(global.spellSelect = 4 && global.pHP = global.pHPMax) {
		sprite_index = spr_player_body_charge;
		attacking = true;
	}
} else { //Holdinggggggggg
	if sprite_index = spr_player_body_charge {
		if mouse_check_button(mb_right) {
			charge++;
			if charge = chargeMax { //Cast it!
				CastSpell();
				global.pMP -= cost;
				sprite_index = spr_player_body_cast;
				charge = 0;
			}
		} else { //Let go
			sprite_index = spr_player_body;
			attacking = false;
			charge = 0;
		}
	}
}

} else {
	image_speed = 0;
}