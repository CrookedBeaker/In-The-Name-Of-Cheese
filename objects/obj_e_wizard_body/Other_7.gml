/// @description finish attacking

if state = "attack" { //Go idle for a moment
	p.state = "idle";
	p.idleWait = 1;
	state = "idle";
}