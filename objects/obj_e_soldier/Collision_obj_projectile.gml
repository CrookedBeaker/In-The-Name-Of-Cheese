/// @description Detect Player, resist!

if invincible = 0 && other.pproj {
	playerSpotted = true;
	
	var c = IsCrit(); //Roll for a critical
	var d = abs(image_angle-other.direction); //Grab the projectile's direction and compare it to your own
	
	if (d < 120 || d > 240 || stunned) { //Attack lands (not shielded, stunned)
	
	if !armor { //Armor disabled
		var d = c ? other.dmg+1 : other.dmg;
		hp -= d;
		NumParticle(d,c);
		
		knockback = 20;
		knockbackDir = point_direction(other.x,other.y,x,y);
		oDir = direction;
		
		invincible = 60;
		
		if other.fire {burn = 180};
		
		BloodSplatter(other.x,other.y);
	} else { //With armor
		hp -= 1;
		NumParticle(1,c);
		
		knockback = 10;
		knockbackDir = point_direction(other.x,other.y,x,y);
		oDir = direction;
		
		invincible = 60;
		
		var d = abs(image_angle-other.direction); //Grab the projectile's direction and compare it to your own
		
		if (d <= 50 || d >= 310) { //Remove armor with a successful hit to the back!
			if !stunned {GoIdle(30)}
			image_index = 2;
			armor = false;
			
			//Drop the armor
			var inst = instance_create_depth(x,y,depth+10,obj_corpse);
			inst.image_angle = knockbackDir+90;
		}
	}
	
	instance_destroy(other);
	
	if !global.muteSound { //Play us a sound!
		audio_play_sound(snd_enemy_hit,10,false);
	}
	
	} else { //Attack is blocked
		instance_destroy(other);
		
		if !global.muteSound {
			audio_play_sound(snd_shieldhit,10,false);
		}
	}
}