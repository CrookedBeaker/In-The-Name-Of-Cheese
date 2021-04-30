/// @description Stop everything, I gotta save lol

global.pause = true;

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
		case 0: //New Game
			MakeButton(0,"Proceed",64,false);
			MakeButton(1,"Cancel",96,true);
			mLabel = "Warning!";
			sLabel = "Starting a new game\nwill delete existing\nsave data."
			break;
		case 1: //Options
			MakeButton(0,"Mute Sound",0,false);
			MakeButton(1,"Mute Music",32,false);
			MakeButton(2,"Close",64,true);
			mLabel = "Options";
			break;
	}
	
	menuID = ind;
}

function ShowText(str) {
	tAlpha = 1;
	tLabel = str;
}