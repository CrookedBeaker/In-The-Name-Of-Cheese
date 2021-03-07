/// @description Take damage, check for bolt!

if invincible = 0 && other.ignorePlayer {
	var c = IsCrit(); //Roll for a critical
	
	if other.object_index != obj_bolt {
		
		if !armor { //Armor disabled
			var d = c ? other.atk*2 : other.atk;
			hp -= d;
			NumParticle(d,c);
			
			knockback = 20;
			knockbackDir = point_direction(other.x,other.y,x,y);
			oDir = direction;
			
			invincible = 60;
			
			BloodSplatter(x,y);
		} else { 
			hp -= 1;
			NumParticle(1,c);
			
			knockback = 10;
			knockbackDir = point_direction(other.x,other.y,x,y);
			
			invincible = 60;
		}
	
	} else { //Get struck!
		hp -= 3;
		NumParticle(3,true);
		
		knockback = 20;
		knockbackDir = point_direction(other.x,other.y,x,y);
		
		invincible = 60;
		
		if armor {
			//Drop the armor
			var inst = instance_create_depth(x,y,depth+10,obj_corpse);
			inst.image_angle = knockbackDir+90;
		}
		
		image_index = 2;
		armor = false;
		GoIdle(60);
		body.sprite_index = spr_e_soldier_shock;
	}
}