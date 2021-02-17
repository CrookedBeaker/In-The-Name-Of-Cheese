/// @description Check if the room is empty, as in no particles

if !(instance_exists(obj_enemy)	
  || instance_exists(obj_particle_exp) 
  || instance_exists(obj_particle_num_gain) 
  || instance_exists(obj_particle_lvlup)) {
	Transition(targetRoom,seq_rhombout,seq_fadein);
}