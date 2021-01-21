/// @description Make it

depth = -100;
camera = camera_create();

//Make the camera
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
width = 640;
height = 480;
var pm = matrix_build_projection_ortho(width,height,1,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

//Movement
follow = obj_player;

if instance_exists(obj_player) {
	x = obj_player.x;
	y = obj_player.y;
}

if !global.loading {
	xTo = x;
	yTo = y;
	stop = false;
}

//My own additions
bounds = [0,0,room_width,room_height];

followNext = noone;

//Create a transition if transitioning
TransitionIn();