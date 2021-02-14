///Room transition functions
global.transition = false;
global.targetRoom = -1;

//Place the sequence
function TransitionPlaceSequence(seq) {
	if layer_exists("transition") {layer_destroy("transition")};
	var l = layer_create(-999,"transition");
	
	//latch onto the camera
	if instance_exists(obj_camera) {
		layer_sequence_create(l,obj_camera.x,obj_camera.y,seq);
		obj_camera.stop = true;
	} else {
		layer_sequence_create(l,320,240,seq);
	}
}

//Initiate a transition
function Transition(targetRoom,seqOut,seqIn) {
	if !global.transition { //Make sure one's not already happening
		global.transition = true;
		global.targetRoom = targetRoom;
		global.transitionIn = seqIn;
		global.prevRoom = room;
		global.pause = true;
		TransitionPlaceSequence(seqOut);
		
		/*
		//Place the transition in sequence in the target room
		layer_set_target_room(targetRoom);
		TransitionPlaceSequence(seqIn);
		layer_reset_target_room();
		*/
		
		return true; //Success!
	} else return false; //Unable to execute
}

//Finish a transition
function TransitionIn() {
	if global.transition { //Make sure one's already happening
		TransitionPlaceSequence(global.transitionIn);
		return true; //Success!
	} else return false; //Unable to execute
}

//Change rooms woo
function TransitionChangeRoom() {
	room_goto(global.targetRoom);
}

//Wrap it up
function TransitionFinished() {
	layer_sequence_destroy(self.elementID);
	global.transition = false;
	global.pause = false;
	
	//Reenable camera movement
	if instance_exists(obj_camera) {obj_camera.stop = false};
}