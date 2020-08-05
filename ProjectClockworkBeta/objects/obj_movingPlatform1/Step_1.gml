// moving to where I should be
SolidMove(velX,velY)

// changing my velocity
oldVelX = velX
oldVelY = velY

if myClock.active {	
	velX += accelX
	velY += accelY
} else {
	velX += deccelX
	velY += deccelY
}

// limiting velocities
if abs(velX) > velXMax {
	velX = sign(velX)*velXMax
}
if abs(velY) > velYMax {
	velY = sign(velY)*velYMax
}

var _xClamped = false
var _yClamped = false

// clamping my velocity
if x+velX < xmin {velX = xmin-x;_xClamped = true}
if x+velX > xmax {velX = xmax-x;_xClamped = true}
if y+velY < ymin {velY = ymin-y;_yClamped = true}
if y+velY > ymax {velY = ymax-y;_yClamped = true}

var _dist = point_distance(0,0,oldVelX,oldVelY)

// adding some sweet sweet screenshake
if velX != 0 and _xClamped {
	screenShake(_dist*2,_dist/8)
	latentVelX = oldVelX
	latentTimer = 5
} else if velY != 0 and _yClamped {
	screenShake(_dist*2,_dist/8)
}

// make the gears turn
image_speed = _dist
if image_speed > 1 image_speed = 1

// handling latency
if latentTimer > 0 {
	latentTimer--
} else {
	latentVelX = velX
}

// setting the clock positino to my position
var _val = point_distance(xs,ys,x,y)/point_distance(xs,ys,xe,ye)
myClock.image_index = 16*_val