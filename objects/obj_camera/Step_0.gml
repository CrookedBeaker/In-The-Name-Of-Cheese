/// @description Skoot
if !stop { //Set where the X and Y need to be
	xReg += (xTo-xReg)/15;
	yReg += (yTo-yReg)/15;
}

//Make sure the camera stays in-bounds
xReg = clamp(xReg,xmin,xmax);
yReg = clamp(yReg,ymin,ymax);

if shakeDur > 0 { //Offset the camera if possible
	var xShake = irandom_range(-shakeInt,shakeInt);
	var yShake = irandom_range(-shakeInt,shakeInt);
	
	x = xReg+xShake;
	y = yReg+yShake;
	
	shakeDur--;
} else { //Regular camera positioning
	x = xReg;
	y = yReg;
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
	} else if (follow != noone) {
		//Cannot manipulate the camera while focused on something else
		xTo = clamp(follow.x+(follow.sprite_width*follow.image_xscale*0.5),xmin,xmax);
		yTo = clamp(follow.y+(follow.sprite_height*follow.image_yscale*0.5),ymin,ymax);
	} /*else if follow != noone {
		//Cannot manipulate the camera while focused on something else
		xTo = clamp(follow.x,xmin,xmax);
		yTo = clamp(follow.y,ymin,ymax);
	}*/
}

//Update the camera
var vm = matrix_build_lookat(x,y,-1000,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);

//Summon the menu
if keyboard_check_pressed(vk_escape) && !global.pauseDisable && !global.transition {
	if instance_exists(obj_escmenu) {
		instance_destroy(obj_escmenu);
	} else {
		instance_create_depth(x,y,depth,obj_escmenu);
	}
}

//Hide it
if keyboard_check_pressed(vk_f1) {global.hideHUD = !global.hideHUD};

//Make UI transparent whenmouse is far away
/*
if object_exists(obj_player) {
	pDist = point_distance(obj_player.x,obj_player.y,mouse_x,mouse_y);
} else {
	pDist = 0;
}