/// @description Stop everything, I gotta save lol

global.pause = true;
obj_camera.stop = true;

function MakeButton(ind,label,yPos) {
	var inst = instance_create_depth(x,y-49+yPos,depth-1,obj_menubutton);
	inst.ind = ind;
	inst.label = label;
}

function NukeButtons() {
	with obj_menubutton instance_destroy();
}

function SetMenu(ind) {
	//Nuke all existing buttons
	NukeButtons();
	
	//Reset selection
	select = -1;
	
	//Make some new ones based on the menu id
	switch ind {
		case 0: //Main
			MakeButton(0,"Resume",0);
			MakeButton(1,"Quick Save",32);
			MakeButton(2,"Load",64);
			MakeButton(3,"Options",96);
			MakeButton(4,"Main Menu",128);
			mLabel = "Menu";
			break;
		case 1: //Load
			var s = global.mainHallReached ? "Main Hall" : "Area Start";
			
			MakeButton(0,"Quick Save",0);
			MakeButton(1,s,32);
			MakeButton(2,"Back",64);
			mLabel = "Load from...";
			break;
		case 2: //Options
			MakeButton(0,"Mute Sound",0);
			MakeButton(1,"Mute Music",32);
			MakeButton(2,"Back",64);
			mLabel = "Options";
			break;
		case 3: //Exit
			MakeButton(0,"Exit",0);
			MakeButton(1,"Cancel",32);
			mLabel = "Quit to menu?";
	}
	
	menuID = ind;
}