/// @description Detect Player, resist!

if invincible = 0 && other.pproj {
	playerSpotted = true;
	
	var c = IsCrit(); //Roll for a critical
	
	if !armor { //Armor disabled
		var d = c ? other.dmg*2 : other.dmg;
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
		
		invincible = 60;
	}
	
	instance_destroy(other);
}