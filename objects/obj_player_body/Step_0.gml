/// @description Stab and stuff
if !global.pause {
image_speed = 1;

if !global.gunMode { //Regular

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

} else { //Gun mode

if mouse_check_button_pressed(mb_left) && !(sprite_index = spr_player_body_shoot || sprite_index = spr_player_body_whip) {
	image_index = 0;
	
	if global.pMP > 0 { //Shoot!
		sprite_index = spr_player_body_shoot;
		
		//Calculate the modifiers for getting the bullet to appear from the gun
		var r = point_distance(0,0,61,14);
		var a = -(image_angle+point_direction(0,0,61,14));
		var xMod = r*dcos(a);
		var yMod = r*dsin(a);
		//Make the bullet
		var inst = MakeProjectile(
			x+xMod,
			y+yMod,
			depth+1,
			point_direction(x+xMod,y+yMod,mouse_x,mouse_y),
			10,
			5,
			spr_bullet,
			false
		);
		inst.pproj = true;
	
		if !global.muteSound { //Play us a sound!
			audio_play_sound(snd_gunshot,10,false);
		}
		
		global.pMP--;
	} else { //Pistol Whip!
		sprite_index = spr_player_body_whip;
		attacking = true;
		
		if !global.muteSound { //Play us a sound!
			audio_play_sound(snd_stab,10,false);
		}
	}
}

}

} else {
	image_speed = 0;
}

/*
//Collision
mask_index = (sprite_index != spr_player_body &&
  sprite_index != spr_player_body_charge &&
  sprite_index != spr_player_body_cast &&
  sprite_index != spr_player_body_shoot) ? sprite_index : spr_pix;