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
			var s = global.muteSound ? "Unmute Snd." : "Mute Sound";
			var m = global.muteMusic ? "Unmute Mus." : "Mute Music";
			
			MakeButton(0,s,0,false);
			MakeButton(1,m,32,false);
			MakeButton(2,"Back",64,true);
			mLabel = "Options";
			break;
		case 2: //Game mode
			MakeButton(0,"Normal",0,false);
			MakeButton(1,"Gun Mode",32,false);
			MakeButton(2,"Cancel",64,true);
			mLabel = "Select Mode";
			break;
	}
	
	menuID = ind;
}

function ShowText(str) {
	tAlpha = 1;
	tLabel = str;
}