//INI Saving

function SaveGame() {
	if file_exists("MainHallSave.save") {file_delete("MainHallSave.save")};
	ini_open("MainHallSave.save");
	
	//Stats
	ini_write_real("Stats","hp",global.pHPMax);
	ini_write_real("Stats","mp",global.pMPMax);
	ini_write_real("Stats","exp",global.pEXP);
	ini_write_real("Stats","exp-max",global.pEXPMax);
	ini_write_real("Stats","lvl",global.pLVL);
	ini_write_real("Stats","atk",global.pATK);
	
	//Spells
	ini_write_real("Spells","spell-0",global.spells[0]);
	ini_write_real("Spells","spell-1",global.spells[1]);
	ini_write_real("Spells","spell-2",global.spells[2]);
	ini_write_real("Spells","spell-3",global.spells[3]);
	ini_write_real("Spells","spell-4",global.spells[4]);
	
	//Keys
	ini_write_real("Keys","keys-0",global.keys[0]);
	ini_write_real("Keys","keys-1",global.keys[1]);
	ini_write_real("Keys","keys-2",global.keys[2]);
	ini_write_real("Keys","keys-3",global.keys[3]);
	
	ini_close();
	
	//Enable loading your save file from esc menu
	global.mainHallReached = true;
}

function LoadGame() {
	ini_open("MainHallSave.save");
	
	//Stats
	global.pHPMax = ini_read_real("Stats","hp",5);
	global.pHP = global.pHPMax;
	global.pMPMax = ini_read_real("Stats","mp",5);
	global.pMP = global.pMPMax;
	global.pEXP = ini_read_real("Stats","exp",0);
	global.pEXPMax = ini_read_real("Stats","exp-max",0);
	global.pLVL = ini_read_real("Stats","lvl",1);
	global.pATK = ini_read_real("Stats","atk",1);
	
	//Spells
	global.spells[0] = ini_read_real("Spells","spell-0",false);
	global.spells[1] = ini_read_real("Spells","spell-1",false);
	global.spells[2] = ini_read_real("Spells","spell-2",false);
	global.spells[3] = ini_read_real("Spells","spell-3",false);
	global.spells[4] = ini_read_real("Spells","spell-4",false);
	
	//Keys
	global.keys[0] = ini_read_real("Keys","keys-0",false);
	global.keys[1] = ini_read_real("Keys","keys-1",false);
	global.keys[2] = ini_read_real("Keys","keys-2",false);
	global.keys[3] = ini_read_real("Keys","keys-3",false);
	
	//Unsaved global defaults
	global.spellSelect = 0;
	global.mainHallReached = true;
	
	ini_close();
	
	//Get outta here
	Transition(rm_mainhall,seq_fadeout,seq_fadein);
}