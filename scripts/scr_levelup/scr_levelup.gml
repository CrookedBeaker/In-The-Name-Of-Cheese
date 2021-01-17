///Level up the player!
function LevelUp(){
	global.pEXP -= global.pEXPMax;
	global.pLVL++;
	
	var ran = irandom(1);
	
	//Level-dependent?
	global.pHPMax++;
	global.pMPMax++;
	
	//A bit of random!
	if global.pHPMax = global.pMPMax+3 {
		global.pMPMax++;
	} else if global.pMPMax = global.pHPMax+3 {
		global.pHPMax++;
	} else { //Give extra point to a random stat
		if ran {
			global.pHPMax++;
		} else {
			global.pMPMax++;
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
	
	global.pEXPMax+=20; //Might tweak later
	instance_create_depth(x,y,-2,obj_particle_lvlup);
}