// gives the clock something it is riding
function clockRiding(_rider){
	riding = _rider
	ridingOffX = x - riding.x
	ridingOffY = y - riding.y
}

function initPlatform(_clock,_xmin,_ymin,_xmax,_ymax,_xAcc,_xDec,_yAcc,_yDec) {
	// stores my corresponding clock
	myClock = _clock

	// stores points for max
	xmin = _xmin
	ymin = _ymin
	xmax = _xmax
	ymax = _ymax

	// how much I accelerate in each direction
	accelX  = _xAcc
	accelY  = _yAcc
	deccelX = _xDec
	deccelY = _yDec
	
	// calculate the start and end points
	xs = x
	xe = x
	ys = y
	ye = y
	if accelX > 0 {
		xs = xmin
		xe = xmax
	} else if accelX < 0 {
		xs = xmax
		xe = xmin
	}
	if accelY > 0 {
		ys = ymin
		ye = ymax
	} else if accelY < 0 {
		ys = ymax
		ye = ymin
	}
}