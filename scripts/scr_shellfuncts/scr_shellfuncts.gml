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
function sh_transition(args) {
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

function sh_goto(args) {
	var rm = asset_get_index(args[1]);
	if room_exists(rm) {
		room_goto(rm);
		return "Sent to room."
	} else {
		return "Invalid room name."
	}
}

function sh_levelUp(args) {
	if instance_exists(obj_player) {
		global.pEXP = global.pEXPMax-1;
		instance_create_depth(obj_player.x,obj_player.y,0,obj_particle_exp);
		return "Leveled up."
	} else {
		return "Requires a player object."
	}
}

function sh_heal(args) {
	if instance_exists(obj_player) {
		global.pHP = global.pHPMax;
		return "Healed."
	} else {
		return "Requires a player object."
	}
}

function sh_magic(args) {
	if instance_exists(obj_player) {
		global.pMP = global.pMPMax;
		return "Restored magic."
	} else {
		return "Requires a player object."
	}
}

function sh_restart(args) {
	SetDefaultGlobals();
	game_restart();
	return "Game restarted."
}

function sh_checkGlobal(args) {
	var g = variable_global_get(args[1]);
	if g != undefined {
		return args[1]+": "+string(g);
	} else {
		return "Unable to find variable.";
	}
}

function sh_kill(args) {
	with obj_enemy {
		hp = 0;
	}
	return "Killed all enemies.";
}