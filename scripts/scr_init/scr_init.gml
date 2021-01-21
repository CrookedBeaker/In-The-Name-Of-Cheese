///Functions for initialization
display_set_gui_size(640,480);

function SetDefaultGlobals() {
	global.pause = false;
	global.pauseDisable = false;
	global.loading = false;
	
	global.pHP = 5;
	global.pHPMax = 5;
	global.pMP = 5;
	global.pMPMax = 5;
	
	global.pEXP = 0;
	global.pEXPMax = 20;
	global.pLVL = 1;
	
	global.pATK = 1;
	
	global.spells = [true,true,true,true,false];
	global.spellSelect = 0;
	
	global.loading = false;
}

SetDefaultGlobals();