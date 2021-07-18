/// @description Yo what
if !global.pause {

if invincible > 0 {invincible--}

if IsAttacked() {
	
	var r = global.gunMode ? clamp(ceil(global.pATK/2),1,3) : global.pATK; //Change the raw attack power depending on gamemode
	var c = IsCrit(); //Roll for a critical
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
}

//Getting knocked back, turning with direction
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
	
	if !global.muteSound { //Play us a sound!
		audio_play_sound(snd_enemy_death,10,false);
	}
	
	//Produce a dead body
	var inst = instance_create_depth(x,y,depth+4,obj_corpse);
	inst.parent = object_index;
	inst.image_angle = knockbackDir-90;
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