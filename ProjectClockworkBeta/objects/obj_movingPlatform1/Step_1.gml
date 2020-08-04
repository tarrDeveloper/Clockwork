// finding where I should be
var _oldVal = val
if myClock != noone {
	val = myClock.val
}
var _newPointX = lerp(point1x,point2x,val)
var _newPointY = lerp(point1y,point2y,val)

// making my velocity be the difference between my starting and ending point
var _oldVelX = velX
var _oldVelY = velY

velX = _newPointX-x
velY = _newPointY-y

// moving to where I should be
SolidMove(velX,velY)

// adjusting my image_index for animation
image_index += min(1,abs(val-_oldVal)*60)*-sign(val-_oldVal)

// screenshake
if (val = 0 || val = 1) and _oldVal != val {
	var _velMag = point_distance(0,0,_oldVelX,_oldVelY)
	var _timeMag = _velMag
	screenShake(_timeMag*60,_velMag/5)
}