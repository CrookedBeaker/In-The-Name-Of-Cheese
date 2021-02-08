/// @description Magic restoration

//About a third
global.pMP += ceil(global.pMPMax/3);
if global.pMP > global.pMPMax {global.pMP = global.pMPMax}

var inst = instance_create_depth(other.x,other.y,other.depth-1,obj_heal);
inst.sprite_index = spr_restore;
instance_destroy();