/// @description GET DE KEY

if !anim {
	anim = true;
	
	if !global.keys[keyID] {
		global.pause = true;
		global.pauseDisable = true;
		
		var inst = instance_create_depth(obj_camera.x,obj_camera.y,-200,obj_unlock);
		inst.image_index = 5;
		
		global.keys[keyID] = true;
	}
}