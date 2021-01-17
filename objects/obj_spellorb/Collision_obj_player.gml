/// @description GET DE SPELL

if !anim {
	anim = true;
	
	global.pause = true;
	global.pauseDisable = true;
	
	var inst = instance_create_depth(obj_camera.x,obj_camera.y,-200,obj_unlock);
	inst.image_index = spellID;
	
	global.spells[spellID] = true;
}