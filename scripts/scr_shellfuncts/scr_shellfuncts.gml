//To be used by the shell

function ShellOpen() {
	global.pause = true;
	global.pauseDisable = true;
}

function ShellClose() {
	global.pause = false;
	global.pauseDisable = false;
}

//Now for the actual stuff
function sh_roomTransition(args) {
	if array_length(args) = 4 {
		var rm = asset_get_index(args[1]);
		var sO = asset_get_index(args[2]);
		var sI = asset_get_index(args[3]);
		
		Transition(rm,sO,sI);
		return ("Transitioning to "+string(args[1]));
	} else {
		return "Expecting 3 arguments:\n-targetRoom\n-seqOut\n-seqIn"
	}
}

function sh_restart(args) {
	SetDefaultGlobals();
	game_restart();
	return "Game restarted."
}