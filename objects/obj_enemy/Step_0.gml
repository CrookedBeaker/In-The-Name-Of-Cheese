/// @description Yo what
if !global.pause {

if invincible > 0 {invincible--}

if IsAttacked() {
	
	var c = IsCrit(); //Roll for a critical
	var d = c ? global.pATK*2 : global.pATK;
	hp -= d;
	NumParticle(d,c);
	
	knockback = 20;
	knockbackDir = point_direction(obj_player.x,obj_player.y,x,y);
	
	invincible = 60;
}

//Getting knocked back, turning with direction
if knockback > 0 {
	knockback = lerp(knockback,0,0.2);
	motion_set(knockbackDir,knockback);
	image_speed = 0;
	
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
	
	//Produce a dead body
	var inst = instance_create_depth(x,y,depth,obj_corpse);
	inst.parent = object_index;
	inst.image_angle = image_angle+90;
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