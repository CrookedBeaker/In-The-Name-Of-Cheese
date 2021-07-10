/// @description Tanky lads

// Inherit the parent event, with some changes.
if !global.pause {

if invincible > 0 {invincible--}

if IsAttacked() { //Detect being attacked, plus a lot of stuff
	
	var r = global.gunMode ? clamp(ceil(global.pATK/2),1,3) : global.pATK; //Change the raw attack power depending on gamemode
	var c = IsCrit(); //Roll for a critical
	var d = abs(image_angle-obj_player_body.direction); //Grab the player's direction and compare it to your own
	
	if (d < 120 || d > 240 || stunned) { //Attack lands (not shielded, stunned)
	
	if !armor { //Unarmored
	
		var d = c ? r+1 : r;
		hp -= d;
		NumParticle(d,c);
		
		knockback = 20;
		knockbackDir = point_direction(obj_player.x,obj_player.y,x,y);
		oDir = direction;
		
		invincible = 60;
		
		with obj_player_body {
			//Calculate the modifiers for getting the blood to appear on the sword
			var r = point_distance(0,0,61,19);
			var a = -(image_angle+point_direction(0,0,61,19));
			var xMod = r*dcos(a);
			var yMod = r*dsin(a);
			
			BloodSplatter(x+xMod,y+yMod);
		}
		
		if !global.muteSound { //Play us a sound!
			audio_play_sound(snd_enemy_hit,10,false);
		}
	
	} else { //Armored
		
		NumParticle(1,c);
		
		knockback = 10;
		knockbackDir = point_direction(obj_player.x,obj_player.y,x,y);
		oDir = direction;
		
		invincible = 60;
		
		if (d <= 50 || d >= 310) { //Remove armor with a successful hit to the back!
			if !stunned {GoIdle(30)}
			image_index = 2;
			armor = false;
			
			//Drop the armor
			var inst = instance_create_depth(x,y,depth+10,obj_corpse);
			inst.image_angle = knockbackDir+90;
		}
		
		if !global.muteSound { //Play us a sound!
			audio_play_sound(snd_enemy_hit,10,false);
		}
	}
	
	} else { //Attack is blocked
		with obj_player {
			knockback = 20;
			knockbackDir = point_direction(other.x,other.y,x,y);
			
			if !global.muteSound {
				audio_play_sound(snd_shieldhit,10,false);
			}
		}
	}
}

//Getting knocked back, turning with direction
if knockback > 0 {
	knockback = lerp(knockback,0,0.2);
	motion_set(knockbackDir,knockback);
	image_speed = 0;
	
	//Correct the way the object is facing after getting knocked back
	if knockback = 0 {
		direction = oDir;
	}
	
	//Leg stuff if they have it
	spd = 0;
	dir = 0;
} else {
	//Set image angle
	image_angle = direction;
	
	//Leg stuff if they have it
	spd = point_distance(xprevious,yprevious,x,y);
	dir = point_direction(xprevious,yprevious,x,y);
}

//BURN
if burn != 0 {
	burn--;
	if burn%60 = 0 {
		hp--;
		NumParticle(1,false);
	}
}

//Death
if hp <= 0 {
	instance_destroy();
	DropExp(expDrop);
	DropRan();
	DropKey();
	
	//Produce a dead body
	var inst = instance_create_depth(x,y,depth+50,obj_corpse);
	inst.parent = object_index;
	inst.image_angle = knockbackDir-90;
	
	if !global.muteSound { //Play us a sound!
		audio_play_sound(snd_enemy_death,10,false);
	}
}

//Idle waiting
if idleWait != 0 {
	idleWait--;
} else {
	stunned = false;
}

} else {
	motion_set(direction,0);
	image_speed = 0;
}


///Now for my own stuff

if !global.pause {
if knockback = 0 {

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
		image_index = 0;
		
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
		image_index = 1;
		
		//Set the direction
		if direction != pDir {
			var relDir = pDir-direction;
			
			if abs(relDir) < 4 {
				direction = pDir;
			} else {
				if abs(relDir) < 180 {
					direction += sign(relDir)*(2+(!armor)) //Regular turning
				} else {
					direction -= sign(relDir)*(2+(!armor)) //Break the barrier turning
				}
			}
		}
		
		motion_set(direction,1+0.5*(!armor));
		
		if (distance_to_object(obj_player) <= 40 && abs(direction-pDir) < 45) {
			state = "attack";
			body.image_index = 0;
		}
		
		//Revert to idle state
		if !instance_exists(obj_player) {GoIdle(1)}
		
		spd = 1+0.5*(!armor);
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