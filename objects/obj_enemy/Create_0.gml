/// @description Functions for enemies!

AddWallCollHBox(hBoxL,hBoxW,0,0);

function GoIdle(time) {
	state = "idle";
	idleWait = time;
}

//Leg stuff
spd = 0;
dir = 0;

//Difficulty scaling based on level
if global.pLVL >= 7 {
	hp+=2;
} else if global.pLVL >= 5 {
	hp++;
}