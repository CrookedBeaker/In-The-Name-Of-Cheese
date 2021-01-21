/// @description Detect Player

// Inherit the parent event
event_inherited();

if variable_instance_exists(other,"playerIgnore") { //Don't crash
	if other.playerIgnore {playerSpotted = true};
}