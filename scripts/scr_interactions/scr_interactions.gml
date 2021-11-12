///Scripts involving complex interactions between objects, this is also the misc script.

//Collide with player's attacks (Only to be used in Step events!!)
function IsAttacked() {
	if !variable_instance_exists(id,"touching") {touching = false}
	if !variable_instance_exists(id,"invincible") {invincible = 0}
	
	if place_meeting(x,y,obj_player_body) && obj_player_body.attacking && (obj_player_body.sprite_index = spr_player_body_stab || obj_player_body.sprite_index = spr_player_body_whip) && invincible = 0 {
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
	inst.image_angle = dir;
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
			
			if (!global.muteSound) {
				audio_play_sound(snd_burn,10,false);
			}
			
			break;
		case 1: //Stunnnnnn
			instance_create_depth(mouse_x,mouse_y,depth-10,obj_stun);
			break;
		case 2: //Thundeirr!
			var inst = instance_create_depth(x+xMod,y+yMod,depth-10,obj_bolt);
			inst.image_angle = point_direction(x+xMod,y+yMod,mouse_x,mouse_y);
			
			if (!global.muteSound && !audio_is_playing(snd_bolt)) {
				audio_play_sound(snd_bolt,10,false);
			}
			
			break;
		case 3: //Sheeld
			var inst = instance_create_depth(x+xMod,y+yMod,depth,obj_shield);
			inst.image_angle = image_angle;
			break;
		case 4: //Don't die
			instance_create_depth(x,y,depth-10,obj_heal);
			global.pHP = clamp(global.pHP+clamp(global.pMP,1,10),0,global.pHPMax);
			
			if (!global.muteSound && !audio_is_playing(snd_heal)) {
				audio_play_sound(snd_heal,10,false);
			}
	}
}

//Drop a thing depending on health
function DropRan() {
	var chance = 0; //Out of 10
	
	//Increase based on health
	chance += 3-ceil(global.pHP*3/global.pHPMax); //Increase by a max of 3
	
	//Increase based on magic
	chance += 3-ceil(global.pMP*3/global.pMPMax); //Increase by a max of 3
	
	//Generate randomly!
	if (irandom(9) < chance) {
		if (global.pHP < global.pMP) { //Drop a potion first, then alternate if hp is less than mp
			if (instance_number(obj_potion) <= instance_number(obj_elixir)) {
				instance_create_depth(x,y,depth,obj_potion);
			} else {
				instance_create_depth(x,y,depth,obj_elixir);
			}
		} else { //Drop an elixir first, then alternate if mp is less than hp
			if (instance_number(obj_elixir) <= instance_number(obj_potion)) {
				instance_create_depth(x,y,depth,obj_elixir);
			} else {
				instance_create_depth(x,y,depth,obj_potion);
			}
		}
	}
}

function DropKey() {
	if !instance_exists(obj_enemy) &&
	  (room = rm_wall_5 || room = rm_barracks_4) {
		instance_create_depth(x,y,depth,obj_key);
	}
}

//Shake the screen!!
function Screenshake(dur,intensity) {
	if instance_exists(obj_camera) { //Make sure you got a camera to work with
		obj_camera.shakeDur = dur;
		obj_camera.shakeInt = intensity;
		
		return true; //Success!
	} else {
		return false; //Failed!
	}
}

//Check for all keys
function AllKeys() {
	return (global.keys[0] && global.keys[1] && global.keys[2] && global.keys[3]);
}

//Play randomized sounds
function ExpSound(small) {
	if !global.muteSound {
		var i = irandom(2);
		
		switch i {
			case 0: audio_play_sound(small ? snd_xp_sm1 : snd_xp_la1, 10, false);
				break;
			case 1: audio_play_sound(small ? snd_xp_sm2 : snd_xp_la2, 10, false);
				break;
			case 2: audio_play_sound(small ? snd_xp_sm3 : snd_xp_la3, 10, false);
		}
	}
}