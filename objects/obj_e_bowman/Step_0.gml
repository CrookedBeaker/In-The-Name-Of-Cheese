/// @description Shuut Arro

// Inherit the parent event
event_inherited();

if !global.pause {
if knockback = 0 {

image_index = !(state = "idle" || state = "turn");

//Player detection
if instance_exists(obj_player) && !ignorePlayer {
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
			
			//Set the way they'll be moving
			var tries = 0;
			do {
				if distance_to_object(obj_player) <= 160 { //Go off in a random direction if not near player
					chaseDir = pDir+180+irandom_range(-90,90); //Random direction!
					if chaseDir > 360 {chaseDir-=360} //Correct it
					
					chaseDur = irandom_range(32,64);
				} else { //Get a bit closer!
					chaseDir = pDir;
					chaseDur = irandom_range(16,32);
				}
				
				tries++;
				if tries = 20 {
					GoIdle(30);
					break;
				}
			} until (!collision_line(x,y,x+chaseDur*2*dcos(chaseDir),y+chaseDur*2*dsin(chaseDir),obj_collision,false,false));
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
		shot = false;
		
		motion_set(chaseDir,2);
		image_angle = pDir;
		chaseDur--;
		
		if chaseDur = 0 {
			state = "attack";
			body.image_index = 0;
		}
		
		//Revert to idle state
		if !instance_exists(obj_player) {GoIdle(1)}
		
		spd = 1;
		dir = direction;
		
		break;
	case "attack": //Shoot him!
		motion_set(pDir,0);
		image_angle = direction;
		
		//Revert to idle state
		if !instance_exists(obj_player) {GoIdle(1)}
		
		//Wait for the body to finish attacking
}

} else { //Reset movement on hit, but not when stunned
	if !stunned {GoIdle(1)}
}

//If hit, know the player is there, regardless of knockback
if place_meeting(x,y,obj_player_body) {playerSpotted = true}

}