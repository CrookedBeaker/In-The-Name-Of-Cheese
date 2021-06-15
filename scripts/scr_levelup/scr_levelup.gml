///Level up the player!
function LevelUp(){
	if global.pLVL < 10 { //Level 10 is the max
	
	global.pEXP -= global.pEXPMax;
	global.pLVL++;
	
	var ran = irandom(1);
	
	//Level-dependent?
	global.pHPMax++;
	global.pMPMax++;
	
	//A bit of random!
	var loops = (global.pLVL = 10) ? 2 : 1; //Give two bonus points for level 10
	
	repeat loops {
		if global.pHPMax >= global.pMPMax+3 {
			global.pMPMax++;
		} else if global.pMPMax >= global.pHPMax+3 {
			global.pHPMax++;
		} else { //Give extra point to a random stat
			if ran {
				global.pHPMax++;
			} else {
				global.pMPMax++;
			}
		}
	}
	
	//Increase attack damage
	if global.pLVL%2 = 1 {
		global.pATK++;
		var inst = instance_create_depth(x,y-26,-2,obj_particle_lvlup);
		inst.strUp = true;
	}
	
	global.pHP = global.pHPMax;
	global.pMP = global.pMPMax;
	
	global.pEXPMax = global.pLVL*20; //Might tweak later
	instance_create_depth(x,y,-2,obj_particle_lvlup);
	
	//Play a sound of congrats
	if (!global.muteSound && !audio_is_playing(snd_levelup)) {
		audio_play_sound(snd_levelup,10,false);
	}
	
	}
}