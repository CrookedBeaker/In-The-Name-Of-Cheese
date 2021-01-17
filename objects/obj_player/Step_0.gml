/// @description a
if !global.pause {

var up = MultiInputStickDigital(ord("W"),gp_axislv,true,false);
var down = MultiInputStickDigital(ord("S"),gp_axislv,false,false);
var left = MultiInputStickDigital(ord("A"),gp_axislh,true,false);
var right = MultiInputStickDigital(ord("D"),gp_axislh,false,false);

if invincible > 0 {invincible--}

//BURN
if burn != 0 {
	burn--;
	if burn%60 = 0 {
		global.pHP--;
		NumParticle(1,false);
	}
}

//Take knockback
if knockback > 0 {
	knockback = lerp(knockback,0,0.2);
	motion_set(knockbackDir,knockback);
} else if !immobile { //Move freely if able
	if up {
		y -= 3;
	}
	
	if left {
		x -= 3;
	}
	
	if down {
		y += 3;
	}
	
	if right {
		x += 3;
	}
	
	
	
	spd = point_distance(xprevious,yprevious,x,y);
	dir = point_direction(xprevious,yprevious,x,y);
	
	//Face the mouse
	direction = point_direction(x,y,mouse_x,mouse_y);
	image_angle = direction;
}

//Switching spells
if global.spells[0] {
	if keyboard_check(ord("1")) {global.spellSelect = 0}
	if keyboard_check(ord("2")) && global.spells[1] {global.spellSelect = 1}
	if keyboard_check(ord("3")) && global.spells[2] {global.spellSelect = 2}
	if keyboard_check(ord("4")) && global.spells[3] {global.spellSelect = 3}
	if keyboard_check(ord("5")) && global.spells[4] {global.spellSelect = 4}
	
	if mouse_wheel_down() {
		do {
			global.spellSelect++;
			if global.spellSelect > 4 {
				global.spellSelect = 0;
			}
		} until global.spells[global.spellSelect]
	}
	
	if mouse_wheel_up() {
		do {
			global.spellSelect--;
			if global.spellSelect < 0 {
				global.spellSelect = 4;
			}
		} until global.spells[global.spellSelect]
	}
}

//Testing
if keyboard_check_pressed(vk_space) {
	if room = Room1 var rm = Room2;
	if room = Room2 var rm = Room1;
	global.test = Transition(rm,seq_rhombout,seq_fadein);
	//layer_sequence_create("Test",x,y,seq_fadein);
}

if global.pHP <= 0 {
	global.pHP = 0;
	instance_destroy();
	instance_destroy(obj_player_body);
	instance_destroy(obj_player_legs);
	DropExp(global.pEXP);
}

}