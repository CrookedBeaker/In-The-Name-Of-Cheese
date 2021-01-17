/// @description Yo what
if !global.pause {

if invincible > 0 {invincible--}

if IsAttacked() {
	
	var c = IsCrit(); //Roll for a critical
	var d = c ? global.pATK*2 : global.pATK;
	hp -= d;
	NumParticle(d,c);
	
	knockback = 20;
	knockbackDir = point_direction(obj_player.x,obj_player.y,x,y);
	
	invincible = 60;
}

//Getting knocked back
if knockback > 0 {
	knockback = lerp(knockback,0,0.2);
	motion_set(knockbackDir,knockback);
}

//BURN
if burn != 0 {
	burn--;
	if burn%60 = 0 {
		hp--;
		NumParticle(1,false);
	}
}

//Death
if hp <= 0 {
	instance_destroy();
	DropExp(expDrop);
}

//Idle waiting
if idleWait != 0 {
	idleWait--;
} else {
	stunned = false;
}

} else {
	motion_set(direction,0);
	image_speed = 0;
}

image_angle = direction;