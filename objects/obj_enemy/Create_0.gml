/// @description Functions for enemies!

AddWallCollHBox(hBoxL,hBoxW,0,0);

function GoIdle(time) {
	state = "idle";
	idleWait = time;
}

//Leg stuff
spd = 0;
dir = 0;