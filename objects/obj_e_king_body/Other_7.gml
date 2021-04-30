/// @description finish attacking

if state = "attack" {
	obj_e_king.state = "idle";
	state = "idle";
}

if state = "slam" {
	obj_e_king.state = "idle";
	obj_e_king.summon = 1;
	state = "idle";
}