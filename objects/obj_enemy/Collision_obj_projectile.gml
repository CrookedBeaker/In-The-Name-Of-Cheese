/// @description Insert description here
// You can write your code in this editor

if invincible = 0 && other.pproj {
	
	var c = IsCrit(); //Roll for a critical
	var d = c ? other.dmg*2 : other.dmg;
	hp -= d;
	NumParticle(d,c);
	
	knockback = 20;
	knockbackDir = point_direction(other.x,other.y,x,y);
	
	invincible = 60;
	
	if other.fire {burn = 180};
	
	instance_destroy(other);
}