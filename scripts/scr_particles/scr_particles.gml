///Particles!!!

//Throw a number particle!
function NumParticle(val,crit) {
	var inst = instance_create_depth(x,y,-1,obj_particle_num);
	inst.val = val;
	inst.crit = crit;
}

//Throw another number particle!
function NumParticleGain(val,color) {
	var inst = instance_create_depth(x,y,-1,obj_particle_num_gain);
	inst.val = val;
	inst.c = color;
}

//Send out an exp orbs
function DropExp(val) {
	//Big EXP
	while val >= 10 {
		var inst = instance_create_depth(x,y,depth+1,obj_particle_exp);
		inst.val = 10;
		val-=10;
	}
	
	//Small EXP
	while val > 0 {
		instance_create_depth(x,y,depth+1,obj_particle_exp);
		val--;
	}
}