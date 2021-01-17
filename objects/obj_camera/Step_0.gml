/// @description Skoot
if !stop {
	x += (xTo-x)/15;
	y += (yTo-y)/15;
}

xmin = (bounds[0]+width/2);
ymin = (bounds[1]+height/2);
xmax = (bounds[2]-width/2);
ymax = (bounds[3]-height/2);

if instance_exists(obj_player) {
	if follow = obj_player && !global.pause {
		if instance_exists(obj_player) {
			//Look! (but only as the player)
			var lookHor = (mouse_x-obj_player.x)/4;
			var lookVer = (mouse_y-obj_player.y)/4;
			
			xTo = clamp(follow.x + (lookHor),xmin,xmax);
			yTo = clamp(follow.y + (lookVer),ymin,ymax);
		}
	} else if follow != noone {
		//Cannot manipulate the camera while focused on something else
		xTo = clamp(follow.x,xmin,xmax);
		yTo = clamp(follow.y,ymin,ymax);
	}
}

//Update the camera
var vm = matrix_build_lookat(x,y,-1000,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);

//Summon the menu
if keyboard_check_pressed(vk_escape) && !global.pauseDisable {
	if instance_exists(obj_escmenu) {
		instance_destroy(obj_escmenu);
	} else {
		instance_create_depth(x,y,depth,obj_escmenu);
	}
}

//Make UI transparent whenmouse is far away
/*
if object_exists(obj_player) {
	pDist = point_distance(obj_player.x,obj_player.y,mouse_x,mouse_y);
} else {
	pDist = 0;
}