/// @description Take damage!

//See if it's blocked by a shield
var blocked = false;
with other {
	blocked = place_meeting(x,y,obj_shield);
}

//Get hurt
if invincible = 0 && !other.ignorePlayer && !blocked {
	var c = IsCrit(); //Roll for a critical
	var d = c ? other.atk+1 : other.atk;
	global.pHP -= d;
	NumParticle(d,c);
	
	knockback = 20;
	knockbackDir = point_direction(other.x,other.y,x,y);
	
	invincible = 180;
	
	//Screenshake, baby!
	Screenshake(10,5);
	
	if !global.muteSound { //Play us a sound!
		audio_play_sound(snd_damage,10,false);
	}
}