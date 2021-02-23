/// @description Steb w speer

// Inherit the parent event
event_inherited();

if !global.pause {
if knockback = 0 {

image_index = !(state = "idle" || state = "turn");

//Player detection
if instance_exists(obj_player) && !ignorePlayer && state != "attack" {
	pDir = point_direction(x,y,obj_player.x,obj_player.y);
	
	if !playerSpotted {playerSpotted = (abs(pDir-direction) < 30 && distance_to_object(obj_player) <= 320 && !collision_line(x,y,obj_player.x,obj_player.y,obj_collision,0,0))};
}

//Handle active states
switch state {
	case "idle": //Idle, that's about it
		//Reset turning direction
		motion_set(direction,0);
		
		var r = irandom(1);
		targetDir = (r = 0) ? direction+45 : direction-45;
		if targetDir < 0 {targetDir+=360};
		turnDir = (r = 0);
		
		//Wait for idle to be done
		if idleWait = 0 && instance_exists(obj_player) {
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
		motion_set(pDir,1);
		
		if distance_to_object(obj_player) <= 64 {
			state = "attack";
			body.image_index = 0;
		}
		
		//Revert to idle state
		if !instance_exists(obj_player) {GoIdle(1)}
		
		spd = 1;
		dir = direction;
		
		break;
	case "attack": //Hit him!
		motion_set(pDir,0);
		//Wait for the body to finish attacking
}

}

//If hit, know the player is there, regardless of knockback
if place_meeting(x,y,obj_player_body) {playerSpotted = true}

}