/// @description Select in something

//Spawn in the buttons!
if !buttonsInit {
	//Start here
	SetMenu(0);
	buttonsInit = true;
}

//Menu functionality
switch menuID {
	case 0: //Main
		
		switch select {
			case 0: //Destroy
				instance_destroy();
				break;
			case 1: //Quick Save
				if instance_exists(obj_player) { //Can't be dead
					if room != rm_dhall { //Can't be fighting the final boss
						QuickSave();
						ShowText("Saved!");
					} else {
						ShowText("You can't save during this fight.");
					}
				} else {
					ShowText("Must be alive to save.");
				}
				select = -1;
				break;
			case 2: //Load
				SetMenu(1);
				break;
			case 3: //Options
				SetMenu(2);
				break;
			case 4: //Exit
				SetMenu(3);
		}
		break;
	
	case 1: //Load
		
		switch select {
			case 0: //QS / Restart fight
				if room != rm_dhall { //Load quick save
					var i = QuickLoad();
					if !i {ShowText("No save found.")}
					select = -1;
				} else { //Restart the final boss
					LoadGameFR();
					instance_destroy();
				}
				
				break;
			case 1: //Area Start / Main Hall
				if global.mainHallReached {
					LoadGame();
				} else {
					SetDefaultGlobals();
					Transition(rm_sewer_1,seq_fadeout,seq_fadein);
				}
				instance_destroy();
				break;
			case 2 : //Back
				SetMenu(0);
		}
		break;
		
	case 2: //Options
		
		switch select {
			case 0: //M. Sound
				global.muteSound = !global.muteSound;
				SetMenu(2); //Refresh the list
				break;
			case 1: //M. Music
				global.muteMusic = !global.muteMusic;
				SetMenu(2); //Refresh the list
				
				if (global.muteMusic) {//(Un)Pause all music
					audio_pause_sound(mus_castlewall);
					audio_pause_sound(mus_dungeon);
					audio_pause_sound(mus_mainhall);
					audio_pause_sound(mus_sewers);
					audio_pause_sound(mus_library);
					audio_pause_sound(mus_barracks);
				} else {
					audio_resume_all();
				}
				break;
			case 2 : //Back
				SaveSettings(); //Save your settings!
				SetMenu(0);
		}
		break;
		
	case 3: //Quit game
		
		if select = 0 {
			Transition(rm_title,seq_fadeout,seq_fadein);
			instance_destroy();
		} else if select = 1 {
			SetMenu(0);
		}
}

//Make text disappear!
if tAlpha > 0 {
	tAlpha -= 1/180;
}