/// @description Steb w speer

// Inherit the parent event
event_inherited();

if !global.pause {

image_index = !(state = "idle" || state = "turn");

//Player detection
if instance_exists(obj_player) && !ignorePlayer && state != "attack" {
	pDir = point_direction(x,y,obj_player.x,obj_player.y);
	
	if !playerSpotted {playerSpotted = (abs(pDir-direction) < 30 && distance_to_object(obj_player) <= 320)};
}

//Handle active states
switch state {
	case "idle": //Idle, that's about it
		//Reset turning direction
		direction = startDir;
		var r = irandom(1);
		targetDir = (r = 0) ? startDir+45 : startDir-45;
		if targetDir < 0 {targetDir+=360};
		turnDir = (r = 0);
		
		//Wait for idle to be done
		if idleWait = 0 {
			state = playerSpotted ? "chase" : "turn";
		}
		
		break;
	case "turn": //Patrol
		direction += turnDir ? 1 : -1; //Turn!
		if direction = targetDir { //Swap turning directions
			targetDir = (targetDir = startDir+45) ? startDir-45 : startDir+45;
			if targetDir < 0 {targetDir+=360};
			turnDir = !turnDir;
		}
		
		//If you see the player, chase him!
		if playerSpotted && !playerIgnore {state = "chase"};
		
		break;
	case "chase": //Run after him
		motion_set(pDir,0.5);
		
		if distance_to_object(obj_player) <= 96 {
			state = "attack";
			body.image_index = 0;
		}
		
		break;
	case "attack": //Hit him!
		motion_set(pDir,0);
		//Wait for the body to finish attacking
}

//Leg stuff
spd = point_distance(xprevious,yprevious,x,y);
dir = point_direction(xprevious,yprevious,x,y);

}