/// @description Do the thing
if !global.transition && !instance_exists(obj_titlesubmenu) {

switch ind {
	case 0: //New game
		if GMFileExists() { //Prompt for a game mode
			var inst = instance_create_depth(320,240,0,obj_titlesubmenu);
			inst.menuID = 2;
		} else if SaveExists() { //Prompt for save deletion if saves exist
			var inst = instance_create_depth(320,240,0,obj_titlesubmenu);
			inst.menuID = 0;
		} else { //Start the game if not
			SetDefaultGlobals();
			Transition(rm_sewer_1,seq_fadeout,seq_fadein);
			
			RemoveGMPFile();
			global.gunMode = false;
		}
		break;
	case 1: //Load game
		global.gunMode = GMPFileExists(); //Set gun mode accordingly
		LoadGame();
		break;
	case 2: //Display options
		var inst = instance_create_depth(320,240,0,obj_titlesubmenu);
		inst.menuID = 1;
		break;
	case 3: //End the game lol
		game_end();
		break;
		/*
	case 4: //GUN MODE?
		if SaveExists() { //Prompt for save deletion if saves exist
			var inst = instance_create_depth(320,240,0,obj_titlesubmenu);
			inst.menuID = 0;
		} else { //Start the game if not
			SetDefaultGlobals();
			Transition(rm_sewer_1,seq_fadeout,seq_fadein);
			
			MakeGMPFile();
			global.gunMode = true;
		}
		*/
}

audio_play_sound(snd_button_confirm,10,false);

}