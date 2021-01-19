///Scripts involving complex interactions between objects, this is also the misc script.

//Collide with player's attacks (Only to be used in Step events!!)
function IsAttacked() {
	if !variable_instance_exists(id,"touching") {touching = false}
	if !variable_instance_exists(id,"invincible") {invincible = 0}
	
	if place_meeting(x,y,obj_player_body) && obj_player_body.attacking && obj_player_body.sprite_index = spr_player_body_stab && invincible = 0 {
		//Return true only on the first frame of being touched
		var i = !touching;
		touching = true;
		return i;
	} else { //Reset touching status
		touching = false;
		return false;
	}
}

//Critical calculation (account for crit value later)
function IsCrit() {
	var i = irandom(15);
	return (i=0)
}

//Make a wall collision hitbox object for the object
function AddWallCollHBox(l,w,x,y) {
	var inst = instance_create_depth(x,y,depth+1,obj_collisionhbox);
	inst.obj = id;
	inst.image_xscale = l/32;
	inst.image_yscale = w/32;
	inst.image_alpha = 0;
}

//Proectiles!!!
function MakeProjectile(x,y,depth,dir,spd,dmg,sprite,fire) {
	var inst = instance_create_depth(x,y,depth,obj_projectile);
	inst.direction = dir;
	inst.spd = spd;
	inst.dmg = dmg;
	inst.sprite_index = sprite;
	inst.fire = fire; //Does fire damage?
	
	return inst;
}

//Cast the currently equipped spell
function CastSpell() {
	//Calculate the modifiers for getting the spell to appear on the hand
	var r = point_distance(0,0,61,-19);
	var a = -(image_angle+point_direction(0,0,61,-19));
	var xMod = r*dcos(a);
	var yMod = r*dsin(a);
	
	switch global.spellSelect {
		case 0: //Fiyah!
			var inst = MakeProjectile(
				x+xMod,
				y+yMod,
				depth-1,
				point_direction(x+xMod,y+yMod,mouse_x,mouse_y),
				5,
				1,
				spr_fire,
				true
			);
			inst.pproj = true;
			break;
		case 1: //Stunnnnnn
			instance_create_depth(mouse_x,mouse_y,depth-10,obj_stun);
			break;
		case 2: //Thundeirr!
			var inst = instance_create_depth(x+xMod,y+yMod,depth-10,obj_bolt);
			inst.image_angle = point_direction(x+xMod,y+yMod,mouse_x,mouse_y);
			break;
		case 3: //Sheeld
			var inst = instance_create_depth(x+xMod,y+yMod,depth,obj_shield);
			inst.image_angle = image_angle;
			break;
		case 4: //Don't die
			instance_create_depth(x,y,depth-10,obj_heal);
			global.pHP = clamp(global.pHP+10,0,global.pHPMax);
	}
}

//Check to see if an object already has a p variable of an object's ID
function NoIdForP(object) {
	var i = true;
	var inst = id;
	
	with object {
		if variable_instance_exists(id,"p") {
			if p = inst {i = false};
		}
	}
	
	return i;
}

//Retrieve the object with it
function GetIdForP(object) {
	var inst = id;
	var i = -1;
	
	with object {
		if variable_instance_exists(id,"p") {
			if p = inst {i = id};
		}
	}
	
	return i;
}