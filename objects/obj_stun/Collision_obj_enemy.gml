/// @description Stun!

with other {
	if !stunned {
		state = "idle";
		idleWait = 360;
		stunned = true;
	}
}