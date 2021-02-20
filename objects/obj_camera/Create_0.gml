/// @description Make it

depth = -100;
camera = camera_create();

//Movement
follow = obj_player;

if instance_exists(obj_player) { //Start on the player
	xReg = obj_player.x;
	yReg = obj_player.y;
	
	x = xReg;
	y = yReg;
}

//Make the camera
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
width = 640;
height = 480;
var pm = matrix_build_projection_ortho(width,height,1,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

if !global.loading {
	xTo = x;
	yTo = y;
	stop = false;
}

//My own additions
bounds = [0,0,room_width,room_height];

//Make sure the camera can't go outside the room at spawn
xmin = (bounds[0]+width/2);
ymin = (bounds[1]+height/2);
xmax = (bounds[2]-width/2);
ymax = (bounds[3]-height/2);

x = clamp(x,xmin,xmax);
y = clamp(y,ymin,ymax);

followNext = noone;

//Create a transition if transitioning
TransitionIn();