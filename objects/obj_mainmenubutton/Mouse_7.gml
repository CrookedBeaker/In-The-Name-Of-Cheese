/// @description Do the thing
if !global.transition {

switch ind {
	case 0: //New game
		SetDefaultGlobals();
		Transition(rm_sewer_1,seq_fadeout,seq_fadein);
		break;
	case 1: //Load game
		
		break;
	case 2: //Display options
		
		break;
	case 3: //End the game lol
		game_end();
}

}