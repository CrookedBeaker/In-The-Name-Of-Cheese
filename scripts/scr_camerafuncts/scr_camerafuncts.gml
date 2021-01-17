///For dynamic camera usage

///Basic stuff needed for later
function CameraSetTarget(obj) { //Switch targets
	if instance_exists(obj_camera) {
		obj_camera.follow = obj;
		return true;
	} else return false;
}

function CameraSetMoving(val) { //Stop/start moving
	if instance_exists(obj_camera) {
		obj_camera.stop = val;
		return true;
	} else return false;
}

///More dynamic uses
function CameraShortFocus(inst) {
	if instance_exists(obj_camera) {
		obj_camera.timeline_index = tln_shortfocus;
		obj_camera.timeline_position = 0;
		obj_camera.timeline_running = true;
		obj_camera.timeline_loop = false;
		obj_camera.followNext = inst;
		return true;
	} else return false;
}