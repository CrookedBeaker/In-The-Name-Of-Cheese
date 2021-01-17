/// @description Grow and shrink

if !global.pause {
motion_set(direction,spd);

if grow {
	xScale = lerp(xScale,2,0.2);
	yScale = xScale;
	
	grow = !(xScale=2)
} else {
	xScale = lerp(xScale,0,0.2);
	yScale = xScale;
}

if xScale = 0 {
	instance_destroy();
}

} else {
	motion_set(direction,0);
}