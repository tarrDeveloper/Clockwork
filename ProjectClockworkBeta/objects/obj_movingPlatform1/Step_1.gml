// move here

// finding where I should be
var _oldVal = val
if myClock != noone {
	val = myClock.val
}
var _newPointX = lerp(point1x,point2x,val)
var _newPointY = lerp(point1y,point2y,val)

velX = _newPointX-x
velY = _newPointY-y

// moving to where I should be
SolidMove(velX,velY)

// adjusting my image_idnex cause yes
image_index += min(1,abs(val-_oldVal)*60)