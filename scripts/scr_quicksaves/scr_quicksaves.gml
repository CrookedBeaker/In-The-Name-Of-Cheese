//Quick save and load

function QuickSave() {

//Make an array for the save
var data = array_create(0);

//Start saving instances!
with obj_player {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth,
		immobile : immobile,
		spd : spd,
		dir : dir,
		knockback : knockback,
		knockbackDir : knockbackDir,
		invincible : invincible,
		burn : burn
	}
	array_push(data,entity);
}

with obj_player_body {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth,
		attacking : attacking
	}
	array_push(data,entity);
}

with obj_player_legs {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth
	}
	array_push(data,entity);
}

with obj_camera {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth,
		bounds : bounds,
		xTo : xTo,
		xReg : xReg,
		yTo : yTo,
		yReg : yReg,
		stop : stop
	}
	array_push(data,entity);
}

with obj_projectile {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth,
		spd : spd,
		fire : fire,
		dmg : dmg,
		pproj : pproj
	}
	array_push(data,entity);
}

with obj_particle_exp {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth,
		val : val
	}
	array_push(data,entity);
}

with obj_bolt {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth,
		atk : atk,
		ignorePlayer : ignorePlayer
	}
	array_push(data,entity);
}

with obj_shield {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth,
		lifetime : lifetime
	}
	array_push(data,entity);
}

with obj_stun {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth
	}
	array_push(data,entity);
}

//Switches and stuff
with obj_switch {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth
	}
	array_push(data,entity);
}

with obj_focus {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth,
		swX : swX,
		swY : swY
	}
	array_push(data,entity);
}

//Oh god all the enemies
with obj_enemy {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth,
		state : state,
		hp : hp,
		knockback : knockback,
		knockbackDir : knockbackDir,
		invincible : invincible,
		idleWait : idleWait,
		burn : burn,
		stunned : stunned
	}
	
	if entity.obj = "obj_e_rat" {
		entity.spd = spd;
		entity.turnSpeed = turnSpeed;
		entity.chargeDur = chargeDur;
		entity.nextDir = nextDir;
		entity.playerSpotted = playerSpotted;
		entity.playerIgnore = playerIgnore;
	}
	
	if entity.obj = "obj_e_guard" {
		entity.startDir = startDir;
		entity.targetDir = targetDir;
		entity.playerSpotted = playerSpotted;
		entity.playerIgnore = playerIgnore;
		entity.turnDir = turnDir;
	}
	
	if entity.obj = "obj_e_bowman" {
		entity.startDir = startDir;
		entity.targetDir = targetDir;
		entity.playerSpotted = playerSpotted;
		entity.playerIgnore = playerIgnore;
		entity.turnDir = turnDir;
		entity.chaseDur = chaseDur;
		entity.chaseDir = chaseDir;
	}
	
	array_push(data,entity);
}

//Pickups
with obj_potion {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth
	}
	array_push(data,entity);
}

with obj_elixir {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth
	}
	array_push(data,entity);
}

//Dead bodies
with obj_corpse {
	var entity = {
		obj : object_get_name(object_index),
		y : y,
		x : x,
		image_index : image_index,
		sprite_index : sprite_index,
		direction : direction,
		depth : depth,
		parent : parent
	}
	array_push(data,entity);
}

//Add global stuff
var entity = {
	obj : "global",
	HP : global.pHP,
	HPMax : global.pHPMax,
	MP : global.pMP,
	MPMax : global.pMPMax,
	EXP : global.pEXP,
	EXPMax : global.pEXPMax,
	LVL : global.pLVL,
	ATK : global.pATK,
	spells : global.spells,
	spellSelect : global.spellSelect,
	
	rm : room
}
array_push(data,entity);

//Convert to a JSON string using a buffer
var saveStr = json_stringify(data);
var buffer = buffer_create(string_byte_length(saveStr)+1,buffer_fixed,1);
buffer_write(buffer,buffer_string,saveStr);
buffer_save(buffer,"quicksave.save");

show_debug_message("Quick saved.");

}

//Switch to the right room to load from
function LoadRoom(rm) {
	global.loading = true;
	global.pause = true;
	room_goto(rm);
}

//Load!
function QuickLoad() {
if file_exists("quicksave.save") {

global.loading = true;
//global.loadingRoom = room;

//Erase game state lol
with obj_escmenu instance_destroy();
with obj_menubutton instance_destroy();
with obj_player instance_destroy();
with obj_player_body instance_destroy();
with obj_player_legs instance_destroy();
with obj_camera instance_destroy();
with obj_enemy instance_destroy();
with obj_particle_exp instance_destroy();
with obj_particle_lvlup instance_destroy();
with obj_particle_num instance_destroy();
with obj_particle_num_gain instance_destroy();
with obj_bolt instance_destroy();
with obj_shield instance_destroy();
with obj_stun instance_destroy();
with obj_potion instance_destroy();
with obj_elixir instance_destroy();
with obj_switch instance_destroy();
with obj_focus instance_destroy();
with obj_corpse instance_destroy();

//Load it!
var buffer = buffer_load("quicksave.save");
var str = buffer_read(buffer,buffer_string);
buffer_delete(buffer)

var loadData = json_parse(str);

//Apply it!
while array_length(loadData) > 0 {
	var entity = array_pop(loadData);
	
	if entity.obj != "global" { //Load the entity
		var inst = instance_create_depth(0,0,layer,asset_get_index(entity.obj));
		
		with inst {
			y = entity.y;
			x = entity.x;
			image_index = entity.image_index;
			sprite_index = entity.sprite_index;
			direction = entity.direction;
			image_angle = direction; //Testing
			depth = entity.depth;
			
			switch entity.obj {
				case "obj_player":
					immobile = entity.immobile;
					spd = entity.spd;
					dir = entity.dir;
					knockback = entity.knockback;
					knockbackDir = entity.knockbackDir;
					invincible = entity.invincible;
					burn = entity.burn;
					break;
				case "obj_player_body":
					attacking = entity.attacking;
					break;
				case "obj_camera":
					bounds = entity.bounds;
					xTo = entity.xTo;
					xReg = entity.xReg;
					yTo = entity.yTo;
					yReg = entity.yReg;
					stop = entity.stop;
					break;
				case "obj_projectile":
					spd = entity.spd;
					fire = entity.fire;
					dmg = entity.dmg;
					pproj = entity.pproj;
					break;
				case "obj_particle_exp":
					val = entity.val;
					break;
				case "obj_bolt":
					atk = entity.atk;
					ignorePlayer = entity.ignorePlayer;
					break;
				case "obj_shield":
					lifetime = entity.lifetime;
					break;
				case "obj_focus":
				case "obj_gate":
					swX = entity.swX;
					swY = entity.swY;
					//swIns = entity.swIns;
					break;
				case "obj_enemy":
					state = entity.state;
					hp = entity.hp;
					knockback = entity.knockback;
					knockbackDir = entity.knockbackDir;
					invincible = entity.invincible;
					idleWait = entity.idleWait;
					burn = entity.burn;
					stunned = entity.stunned;
					break;
				case "obj_e_rat":
					state = entity.state;
					hp = entity.hp;
					knockback = entity.knockback;
					knockbackDir = entity.knockbackDir;
					invincible = entity.invincible;
					idleWait = entity.idleWait;
					burn = entity.burn;
					stunned = entity.stunned;
					spd = entity.spd;
					turnSpeed = entity.turnSpeed;
					chargeDur = entity.chargeDur;
					nextDir = entity.nextDir;
					playerSpotted = entity.playerSpotted;
					playerIgnore = entity.playerIgnore;
					break;
				case "obj_e_guard": //Guards
					state = entity.state;
					hp = entity.hp;
					knockback = entity.knockback;
					knockbackDir = entity.knockbackDir;
					invincible = entity.invincible;
					idleWait = entity.idleWait;
					burn = entity.burn;
					stunned = entity.stunned;
					startDir = entity.startDir;
					targetDir = entity.targetDir;
					playerSpotted = entity.playerSpotted;
					playerIgnore = entity.playerIgnore;
					turnDir = entity.turnDir;
					break;
				case "obj_e_bowman": //Bowmen
					state = entity.state;
					hp = entity.hp;
					knockback = entity.knockback;
					knockbackDir = entity.knockbackDir;
					invincible = entity.invincible;
					idleWait = entity.idleWait;
					burn = entity.burn;
					stunned = entity.stunned;
					startDir = entity.startDir;
					targetDir = entity.targetDir;
					playerSpotted = entity.playerSpotted;
					playerIgnore = entity.playerIgnore;
					turnDir = entity.turnDir;
					chaseDur = entity.chaseDur;
					chaseDir = entity.chaseDir;
					break;
				case "obj_corpse": //Dead Bodies
					parent = entity.parent;
			}
		}
		
	} else { //Load global stuff
		
		global.pHP = entity.HP;
		global.pHPMax = entity.HPMax;
		global.pMP = entity.MP;
		global.pMPMax = entity.MPMax;
		
		global.pEXP = entity.EXP;
		global.pEXPMax = entity.EXPMax;
		global.pLVL = entity.LVL;
		
		global.pATK = entity.ATK;
		
		global.spells = entity.spells;
		global.spellSelect = entity.spellSelect;
		
		if entity.rm != room {
			LoadRoom(entity.rm);
			show_debug_message("Switching to the room in the save.");
		} else {
			global.loading = false;
			show_debug_message("Quick save loaded.");
		}
	}
}

//Spawn in the menu afterwards
instance_create_depth(obj_camera.x,obj_camera.y,obj_camera.depth,obj_escmenu);

} else { //No save file
	
	show_debug_message("No save file found.");
	
}

}