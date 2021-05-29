/// @description Get healed a bit

//About a third
global.pHP += ceil(global.pHPMax/3);
if global.pHP > global.pHPMax {global.pHP = global.pHPMax}

instance_create_depth(other.x,other.y,other.depth-1,obj_heal);
instance_destroy();

if (!global.muteSound && !audio_is_playing(snd_heal)) {
	audio_play_sound(snd_heal,10,false);
}