/// @description Initialize

global.test = false;

if !instance_exists(obj_player_body) {
	var inst = instance_create_depth(x,y,depth+1,obj_player_body);
	inst.direction = direction;
	inst.image_angle = image_angle;
}
if !instance_exists(obj_player_legs) instance_create_depth(x,y,depth+2,obj_player_legs);

AddWallCollHBox(48,48,0,0);