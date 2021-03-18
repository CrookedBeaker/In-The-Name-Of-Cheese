/// @description Do the thing
if !global.transition && !instance_exists(obj_titlesubmenu) {

switch ind {
	case 0: //New game
		if SaveExists() { //Prompt for save deletion if saves exist
			var inst = instance_create_depth(320,240,0,obj_titlesubmenu);
			inst.menuID = 0;
		} else { //Start the game if not
			SetDefaultGlobals();
			Transition(rm_sewer_1,seq_fadeout,seq_fadein);
		}
		break;
	case 1: //Load game
		LoadGame();
		break;
	case 2: //Display options
		var inst = instance_create_depth(320,240,0,obj_titlesubmenu);
		inst.menuID = 1;
		break;
	case 3: //End the game lol
		game_end();
}

}