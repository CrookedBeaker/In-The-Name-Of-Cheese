/// @description Let's try something different

function SummonShield() { //Summon four shields around him if there are none present
	if !instance_exists(obj_kingshield) {
		for (var i = 0; i < 4; i++) {
			var inst = instance_create_depth(x,y,depth-1,obj_kingshield);
			inst.image_angle += i*90;
			inst.direction += i*90;
		}
	}
}

function SummonEnemy(enemy,x,y,dir) {
	var inst = instance_create_depth(x,y,depth,enemy);
	inst.direction = dir;
	inst.image_angle = dir;
	inst.playerSpotted = true;
	
	if inst.object_index = obj_e_wizard {
		inst.activeArea = [160,128,608,800];
	}
	
	instance_create_depth(x,y,depth-1,obj_poof);
}

function SummonNextWave() {
	wave++;
	if wave > 8 {wave = 1}
	
	switch wave {
		case 1:
			SummonEnemy(obj_e_guard,192,208,0);
			SummonEnemy(obj_e_guard,576,208,180);
			
			SummonEnemy(obj_e_guard,384,704,90);
			SummonEnemy(obj_e_guard,288,640,90);
			SummonEnemy(obj_e_guard,480,640,90);
			
			SummonEnemy(obj_e_soldier,384,560,90);
			break;
		case 2:
			SummonEnemy(obj_e_bowman,160,352,0);
			SummonEnemy(obj_e_bowman,160,512,0);
			SummonEnemy(obj_e_bowman,160,672,0);
			SummonEnemy(obj_e_bowman,608,352,180);
			SummonEnemy(obj_e_bowman,608,512,180);
			SummonEnemy(obj_e_bowman,608,672,180);
			
			break;
		case 3:
			SummonEnemy(obj_e_guard,192,208,0);
			SummonEnemy(obj_e_guard,576,208,180);
			
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			
			SummonEnemy(obj_e_guard,384,704,90);
			SummonEnemy(obj_e_guard,288,640,90);
			SummonEnemy(obj_e_guard,480,640,90);
			
			break;
		case 4:
			SummonEnemy(obj_e_soldier,384,704,90);
			SummonEnemy(obj_e_soldier,288,640,90);
			SummonEnemy(obj_e_soldier,480,640,90);
			
			SummonEnemy(obj_e_bowman,160,352,0);
			SummonEnemy(obj_e_bowman,160,512,0);
			SummonEnemy(obj_e_bowman,160,672,0);
			SummonEnemy(obj_e_bowman,608,352,180);
			SummonEnemy(obj_e_bowman,608,512,180);
			SummonEnemy(obj_e_bowman,608,672,180);
			
			break;
		case 5:
			SummonEnemy(obj_e_guard,192,208,0);
			SummonEnemy(obj_e_guard,576,208,180);
			
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			
			SummonEnemy(obj_e_soldier,384,704,90);
			SummonEnemy(obj_e_soldier,288,640,90);
			SummonEnemy(obj_e_soldier,480,640,90);
			
			break;
		case 6:
			SummonEnemy(obj_e_guard,384,704,90);
			SummonEnemy(obj_e_guard,288,640,90);
			SummonEnemy(obj_e_guard,480,640,90);
			
			SummonEnemy(obj_e_soldier,384,560,90);
			
			SummonEnemy(obj_e_bowman,160,352,0);
			SummonEnemy(obj_e_bowman,160,512,0);
			SummonEnemy(obj_e_bowman,160,672,0);
			SummonEnemy(obj_e_bowman,608,352,180);
			SummonEnemy(obj_e_bowman,608,512,180);
			SummonEnemy(obj_e_bowman,608,672,180);
			
			break;
		case 7:
			SummonEnemy(obj_e_soldier,384,704,90);
			SummonEnemy(obj_e_soldier,288,640,90);
			SummonEnemy(obj_e_soldier,480,640,90);
			
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			
			break;
		case 8:
			SummonEnemy(obj_e_guard,192,208,0);
			SummonEnemy(obj_e_guard,576,208,180);
			
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			SummonEnemy(obj_e_wizard,-32,-32,0);
			
			SummonEnemy(obj_e_bowman,160,352,0);
			SummonEnemy(obj_e_bowman,160,512,0);
			SummonEnemy(obj_e_bowman,160,672,0);
			SummonEnemy(obj_e_bowman,608,352,180);
			SummonEnemy(obj_e_bowman,608,512,180);
			SummonEnemy(obj_e_bowman,608,672,180);
			
			break;
	}
}

if !instance_exists(obj_e_king_body) {instance_create_depth(x,y,depth+1,obj_e_king_body)}