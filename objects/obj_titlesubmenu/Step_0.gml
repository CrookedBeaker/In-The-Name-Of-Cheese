/// @description Select in something

//Spawn in the buttons!
if !buttonsInit {
	//Start here
	SetMenu(menuID);
	buttonsInit = true;
}

//Menu functionality
switch menuID {
	case 0: //New game
		
		switch select {
			case 0: //Proceed
				SetDefaultGlobals();
				Transition(rm_sewer_1,seq_fadeout,seq_fadein);
				DeleteSaves();
				instance_destroy();
				break;
				
				//Make or destroy a file as needed
				RemoveGMPFile();
				if global.gunMode {
					MakeGMPFile();
				}
			case 1: //Destroy
				instance_destroy();
				break;
		}
		break;
	
	case 1: //Options
		
		switch select {
			case 0: //M. Sound
				global.muteSound = !global.muteSound;
				SetMenu(1); //Refresh the list
				break;
			case 1: //M. Music
				//Will do later
				break;
			case 2 : //Back
				instance_destroy();
		}
		break;
	
	case 2: //Select mode
		
		switch select {
			case 0: //Normal
				if SaveExists() { //Prompt for save deletion if saves exist
					global.gunMode = false;
					SetMenu(0);
				} else { //Start the game if not
					SetDefaultGlobals();
					Transition(rm_sewer_1,seq_fadeout,seq_fadein);
					
					RemoveGMPFile();
					global.gunMode = false;
					
					instance_destroy();
				}
				break;
			case 1: //Gun Mode
				if SaveExists() { //Prompt for save deletion if saves exist
					global.gunMode = true;
					SetMenu(0);
				} else { //Start the game if not
					SetDefaultGlobals();
					Transition(rm_sewer_1,seq_fadeout,seq_fadein);
					
					MakeGMPFile();
					global.gunMode = true;
					
					instance_destroy();
				}
				break;
			case 2: //Destroy
				instance_destroy();
				break;
		}
		break;
		
}

//Make text disappear!
if tAlpha > 0 {
	tAlpha -= 1/180;
}