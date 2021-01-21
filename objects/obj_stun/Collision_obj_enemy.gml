/// @description Stun!

with other {
	if !stunned {
		state = "idle";
		idleWait = 300;
		stunned = true;
	}
}