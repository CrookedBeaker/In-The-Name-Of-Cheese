/// @description Dispose of the body

if variable_instance_exists(id,"body") { //Workaround for a crash bug
	instance_destroy(body);
	instance_destroy(legs);
}