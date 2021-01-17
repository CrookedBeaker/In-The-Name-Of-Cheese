/// @description Stun!

with other {
	if !stunned {
		state = "idle";
		idleWait = 180;
		stunned = true;
	}
}