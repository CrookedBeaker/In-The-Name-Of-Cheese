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
				break;
			case 1: //Destroy
				instance_destroy();
				break;
		}
		break;
	
	case 1: //Options
		
		switch select {
			case 0: //M. Sound
			case 1: //M. Music
				//Will do later
				break;
			case 2 : //Destroy
				instance_destroy();
				break;
		}
		
}

//Make text disappear!
if tAlpha > 0 {
	tAlpha -= 1/180;
}