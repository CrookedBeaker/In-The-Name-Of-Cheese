/// @description Take damage!

if invincible = 0 && other.ignorePlayer {
	var c = IsCrit(); //Roll for a critical
	var d = c ? other.atk*2 : other.atk;
	hp -= d;
	NumParticle(d,c);
	
	knockback = 20;
	knockbackDir = point_direction(other.x,other.y,x,y);
	
	invincible = 60;
}