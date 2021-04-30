/// @description Stop everything, I gotta save lol

global.pause = true;
obj_camera.stop = true;

function MakeButton(ind,label,yPos,back) {
	var inst = instance_create_depth(x,y-49+yPos,depth-1,obj_menubutton);
	inst.ind = ind;
	inst.label = label;
	inst.back = back;
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
			MakeButton(0,"Resume",0,false);
			MakeButton(1,"Quick Save",32,false);
			MakeButton(2,"Load",64,false);
			MakeButton(3,"Options",96,false);
			MakeButton(4,"Main Menu",128,false);
			mLabel = "Menu";
			break;
		case 1: //Load
			var s = global.mainHallReached ? "Main Hall" : "Area Start";
			var t = (room = rm_dhall) ? "Room Start" : "Quick Save";
			
			MakeButton(0,t,0,false);
			MakeButton(1,s,32,false);
			MakeButton(2,"Back",64,true);
			mLabel = "Load from...";
			break;
		case 2: //Options
			MakeButton(0,"Mute Sound",0,false);
			MakeButton(1,"Mute Music",32,false);
			MakeButton(2,"Back",64,true);
			mLabel = "Options";
			break;
		case 3: //Exit
			MakeButton(0,"Exit",0,false);
			MakeButton(1,"Cancel",32,true);
			mLabel = "Quit to menu?";
	}
	
	menuID = ind;
}

function ShowText(str) {
	tAlpha = 1;
	tLabel = str;
}