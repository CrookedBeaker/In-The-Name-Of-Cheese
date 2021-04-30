/// @description Get spell stuff together

switch global.spellSelect {
	case 0:
		cost = 2;
		chargeMax = 30;
		break;
	case 1:
		cost = 3;
		chargeMax = 20;
		break;
	case 2:
		cost = 2;
		chargeMax = 30;
		break;
	case 3:
		cost = 5;
		chargeMax = 180;
		break;
	case 4:
		cost = clamp(global.pMP,1,clamp(global.pHPMax-global.pHP,1,10));
		chargeMax = 60;	
}