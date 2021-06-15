/// @description Yo what
if !global.pause && !global.transition {

if stunned {stunned = false} //Can't get stunned
if invincible > 0 {invincible--}

if IsAttacked() && !instance_exists(obj_kingshield) {
	
	var c = IsCrit(); //Roll for a critical
	var d = c ? global.pATK+1 : global.pATK;
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
}

//Getting knocked back, turning with direction
/* NOPE, NOT GETTING OUT OF THIS CHAIR
if knockback > 0 {
	idleWait++; //Stop decrementing idleWait
	
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
*/

//BURN
if burn != 0 {
	burn--;
	if burn%60 = 0 {
		hp--;
		NumParticle(1,false);
	}
}

//Death (sorta, just go to cutscene)
if hp <= 0 {
	Transition(rm_ending,seq_rhombout,seq_rhombin);
}

//Idle waiting
if idleWait != 0 {
	idleWait--;
} else {
	stunned = false;
}

//Do your own thing (Semi-placeholder?)
if instance_exists(obj_player) {direction = point_direction(x,y,obj_player.x,obj_player.y)+90};
image_angle = direction;

if (distance_to_object(obj_player) < 128 || distance_to_object(obj_projectile) < 128) && !instance_exists(obj_kingshield) && vuln = 0 && state != "swing" {
	SummonShield();
	vuln = 30;
}

//Handle vulnerability
if vuln > 0 && distance_to_object(obj_player) < 128 && !(instance_exists(obj_e_guard) || instance_exists(obj_e_soldier) || instance_exists(obj_e_bowman) || instance_exists(obj_e_wizard)) {
	vuln--;
	if vuln = 0 {
		state = instance_exists(obj_kingshield) ? "slam" : "swing"; //Skip the swing in the first wave
	}
}

//Summon enemies
if summon = 1 {
	SummonNextWave();
	summon = 2;
}

//HANDLE THE REPERCUSSIONS OF SUMMONING ENEMIES AHAHAHA
if !(instance_exists(obj_e_guard) || instance_exists(obj_e_soldier) || instance_exists(obj_e_bowman) || instance_exists(obj_e_wizard))
  && instance_exists(obj_kingshield) && summon = 2 {
	summon = 0;
	with obj_kingshield {sprite_index = spr_kingshield_out}
	vuln = 330;
	
	if (!global.muteSound && !audio_is_playing(snd_shieldbreak)) {
		audio_play_sound(snd_shieldbreak,10,false);
	}
}

} else {
	motion_set(direction,0);
	image_speed = 0;
}