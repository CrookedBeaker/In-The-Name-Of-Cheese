/// @description Frikkin nerds with their magic

// Inherit the parent event
event_inherited();

if !global.pause {
if knockback = 0 && instance_exists(obj_player) {
	
image_index = !(state = "idle" || state = "hide");
pDir = point_direction(x,y,obj_player.x,obj_player.y);

//Handle active states
switch state {
	case "idle": //Idle, that's about it
		
		if !collision_rectangle(activeArea[0],activeArea[1],activeArea[2],activeArea[3],obj_player,false,false) {idleWait++}
		
		//Wait for idle to be done
		if idleWait <= 0 && instance_exists(obj_player) {
			if InActiveArea() {
				state = "hide";
			} else {
				state = "appear";
			}
		}
		break;
	case "hide": //Getdafakattahea
		shot = false;
		Warp(-32,-32);
		GoIdle(irandom_range(120,240));
		break;
	case "appear": //HOOH!
		var tries = 0;
		var targX = 0;
		var targY = 0;
		
		while (tries < 20 && (place_meeting(targX,targY,obj_collision) || point_distance(targX,targY,obj_player.x,obj_player.y) < 96 || point_distance(targX,targY,obj_player.x,obj_player.y) > 320)) {
			targX = irandom_range(activeArea[0],activeArea[2]);
			targY = irandom_range(activeArea[1],activeArea[3]);
			tries++;
		}
		
		if tries = 20 {
			state = "hide";
		} else {
			Warp(targX,targY);
			direction = pDir;
			state = "charge";
			chargeDur = 90;
		}
		break;
	case "charge":
		direction = pDir;
		
		chargeDur--;
		if chargeDur = 0 {state = "attack"}
		break;
	case "attack":
		//Revert to idle state
		if !instance_exists(obj_player) {GoIdle(1)}
		
		//Wait for the body to finish attacking
}

image_angle = direction;

}

//Bounce the thing off of you
var proj = collision_circle(x,y,48,obj_projectile,0,0);
if proj != noone {
	if proj.pproj {
	
	//Make the effect
	var inst = instance_create_depth(x,y,depth-1,obj_ward);
	inst.image_angle = point_direction(x,y,proj.x,proj.y);
	//And reflect!
	with proj {
		MakeProjectile(x,y,depth,point_direction(x,y,obj_player.x,obj_player.y),spd+1,dmg,sprite_index,fire);
		instance_destroy();
	}
	
	}
}

}