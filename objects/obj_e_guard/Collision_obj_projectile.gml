/// @description Detect Player

// Inherit the parent event
event_inherited();

if variable_instance_exists(other,"pproj") { //Don't crash
	if other.pproj {playerSpotted = true};
}