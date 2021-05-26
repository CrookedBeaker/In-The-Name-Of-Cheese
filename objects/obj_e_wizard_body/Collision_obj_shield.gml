/// @description Bounce off!

p.knockback = 20;
p.knockbackDir = point_direction(other.x,other.y,x,y);

if !global.muteSound && !audio_is_playing(snd_shieldhit) {
	audio_play_sound(snd_shieldhit,10,false);
}