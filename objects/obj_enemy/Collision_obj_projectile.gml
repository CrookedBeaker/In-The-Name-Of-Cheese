/// @description Insert description here
// You can write your code in this editor

if invincible = 0 && other.pproj {
	
	var c = IsCrit(); //Roll for a critical
	var d = c ? other.dmg+1 : other.dmg;
	hp -= d;
	NumParticle(d,c);
	
	knockback = 20;
	knockbackDir = point_direction(other.x,other.y,x,y);
	oDir = direction;
	
	invincible = 60;
	
	if other.fire {
		burn = 180;
		if (!global.muteSound && !audio_is_playing(snd_burn)) {
			audio_play_sound(snd_burn,10,false);
		}
	};
	
	BloodSplatter(other.x,other.y);
	
	instance_destroy(other);
	
	if !global.muteSound { //Play us a sound!
		audio_play_sound(snd_enemy_hit,10,false);
	}
}