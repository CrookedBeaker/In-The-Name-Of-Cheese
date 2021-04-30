/// @description Get knocked back!

state = "idle";
idleWait = 60;

knockback = 20;
knockbackDir = point_direction(other.x,other.y,x,y);
oDir = direction;

if !global.muteSound {
	audio_play_sound(snd_shieldhit,10,false);
}