/// @description RAT!!!!!

// Inherit the parent event
event_inherited();

if !global.pause {

//Player detection
var pDir = 0;
if instance_exists(obj_player) && !playerIgnore {
	var pDir = point_direction(x,y,obj_player.x,obj_player.y);
	
	if !playerSpotted {playerSpotted = (abs(pDir-direction) < 30 && distance_to_object(obj_player) <= 128)};
}

//Handle active states
switch state {
	case "idle": //Idle, that's about it
		image_speed = 0;
		if knockback = 0 {motion_set(direction,0)};
		
		if idleWait = 0 {
			nextDir = irandom(360);
			state = "turn";
		}
		break;
	case "turn": //Turn!
		if playerSpotted {
			nextDir = pDir;
		}
		
		if direction != nextDir {
			direction += (turnSpeed+(turnSpeed*playerSpotted))*sign(nextDir-direction);
			if abs(nextDir-direction) < turnSpeed {
				direction = nextDir;
			}
		} else {
			state = "charge";
			
			if playerSpotted && instance_exists(obj_player) {
				chargeDur = ceil(distance_to_object(obj_player)/4+16);
			} else {
				chargeDur = irandom_range(10,30);
			}
			//while !place_meeting(chargeDur*dcos(direction),chargeDur*dsin(direction),)
		}
		break;
	case "charge":
		image_speed = 1;
		motion_set(direction,2+2*playerSpotted); //for some reason spd gets reset before this so uh... yeah. it's not like it's supposed to at any point.
		chargeDur--;
		if chargeDur = 0 {
			motion_set(direction,0);
			GoIdle(60);
			playerIgnore = playerSpotted; //Stop chasing player for 1 cycle
			playerSpotted = false;
		}
}

}