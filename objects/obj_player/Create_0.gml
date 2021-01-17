/// @description Initialize

global.test = false;

if !instance_exists(obj_player_body) instance_create_depth(x,y,depth+1,obj_player_body);
if !instance_exists(obj_player_legs) instance_create_depth(x,y,depth+2,obj_player_legs);

AddWallCollHBox(48,48,0,0);