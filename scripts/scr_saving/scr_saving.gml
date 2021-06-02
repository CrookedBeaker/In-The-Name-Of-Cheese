//INI Saving

function SaveGame() {
	if file_exists("MainHallSave.save") {file_delete("MainHallSave.save")};
	ini_open("MainHallSave.save");
	
	//Stats
	ini_write_real("Stats","hp",global.pHPMax);
	ini_write_real("Stats","mp",global.pMPMax);
	ini_write_real("Stats","exp",global.pEXP);
	//ini_write_real("Stats","exp-max",global.pEXPMax);
	ini_write_real("Stats","lvl",global.pLVL);
	//ini_write_real("Stats","atk",global.pATK);
	
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
	if file_exists("MainHallSave.save") {
	
	ini_open("MainHallSave.save");
	
	//Stats
	global.pHPMax = ini_read_real("Stats","hp",5);
	global.pHP = global.pHPMax;
	global.pMPMax = ini_read_real("Stats","mp",5);
	global.pMP = global.pMPMax;
	global.pEXP = ini_read_real("Stats","exp",0);
	//global.pEXPMax = ini_read_real("Stats","exp-max",0);
	global.pLVL = ini_read_real("Stats","lvl",1);
	//global.pATK = ini_read_real("Stats","atk",1);
	
	global.pEXPMax = global.pLVL*20;
	global.pATK = ceil(global.pLVL/2);
	
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
	
	//Set Gun Mode
	global.gunMode = GMPFileExists();
	
	//Get outta here
	Transition(rm_mainhall,seq_fadeout,seq_fadein);
	
	}
}

function LoadGameFR() {
	if file_exists("MainHallSave.save") {
	
	ini_open("MainHallSave.save");
	
	//Stats
	global.pHPMax = ini_read_real("Stats","hp",5);
	global.pHP = global.pHPMax;
	global.pMPMax = ini_read_real("Stats","mp",5);
	global.pMP = global.pMPMax;
	global.pEXP = ini_read_real("Stats","exp",0);
	//global.pEXPMax = ini_read_real("Stats","exp-max",0);
	global.pLVL = ini_read_real("Stats","lvl",1);
	//global.pATK = ini_read_real("Stats","atk",1);
	
	global.pEXPMax = global.pLVL*20;
	global.pATK = ceil(global.pLVL/2);
	
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
	
	//Set Gun Mode
	global.gunMode = GMPFileExists();
	
	//Get outta here
	Transition(rm_dhall,seq_fadeout,seq_fadein);
	
	}
}

function DeleteSaves() {
	file_delete("MainHallSave.save");
	file_delete("quicksave.save");
	
	show_debug_message("Save files deleted.");
}

function SaveExists() {
	return (file_exists("MainHallSave.save") || file_exists("quicksave.save"))
}

function GMFileExists() { //Whether or not Gun Mode is unlocked
	return file_exists("YouDidIt.txt");
}

function MakeGMFile() { //Make the file that unlocks Gun Mode
	var f = file_text_open_write("YouDidIt.txt");
	
	var t = "CONGRADULATIONS, PLAYER!!!\n\n"+
		"If you're reading this, you have beat the game, and\n"+
		"have gotten bored with it, so you're rummaging through\n"+
		"the game's save data, which I don't blame you for.\n"+
		"\n"+
		"I mean, what else is there to do?\n"+
		"If you've already beat Gun Mode, that's all there is to\n"+
		"it, and I don't plan to add any more content.\n"+
		"\n"+
		"Regardless, thanks for checking out my lil ol' game.\n"+
		"I appreciate it, really!\n"+
		"\n"+
		"Your friendly neighborhood game dev,\n"+
		"    Russell Vujs, Jr.\n"+
		"     \"Crooked Beaker\"\n"+
		"\n"+
		"P.S. Don't delete this file.\n"+
		"It's used to confirm you have Gun Mode unlocked.";
	
	file_text_write_string(f,t);
	file_text_close(f);
}

function MakeGMPFile() { //Make the file that indicates that the current file is playing on Gun Mode
	var f = file_text_open_write("GunMode.txt");
	
	var t = "This session is playing on Gun Mode.\n\n"+
		"While you're here though...\n"+
		"Follow @CrookedBeaker and @AcidWolf22 on Twitter.\n"+
		"Thanks.\n"+
		"\n"+
		"P.S. Don't delete this file.\n"+
		"It's used to indicate you're playing in Gun Mode.";
	
	file_text_write_string(f,t);
	file_text_close(f);
}

function GMPFileExists() { //Whether or not Gun Mode is active
	return file_exists("GunMode.txt");
}

function RemoveGMPFile() { //Remove Gun Mode Playing file
	file_delete("GunMode.txt");
}