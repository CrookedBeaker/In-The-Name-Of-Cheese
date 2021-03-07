/// @description ANIMATION!!!

if anim && !global.pause {
	if image_alpha != 0 {
		image_xscale+=0.01;
		image_yscale+=0.01;
		image_alpha-=0.01;
	} else {
		instance_destroy();
		Transition(rm_save,seq_rhombout,seq_fadein);
	}
}