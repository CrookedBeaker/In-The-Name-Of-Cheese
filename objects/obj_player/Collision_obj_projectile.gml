/// @description Take damage!

if invincible = 0 && !other.pproj {
	var c = IsCrit(); //Roll for a critical
	var d = c ? other.dmg+1 : other.dmg;
	global.pHP -= d;
	NumParticle(d,c);
	
	knockback = 20;
	knockbackDir = point_direction(other.x,other.y,x,y);
	
	invincible = 180;
	
	if other.fire {burn = 180};
	
	instance_destroy(other);
	
	//Screenshake, baby!
	Screenshake(10,5);
	
	if !global.muteSound { //Play us a sound!
		audio_play_sound(snd_damage,10,false);
	}
}