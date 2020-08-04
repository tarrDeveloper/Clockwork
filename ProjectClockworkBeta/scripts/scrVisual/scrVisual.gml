// this function shakes the screen
function screenShake(_time,_magnitude) {
	if _time > 5 _time = 5
	obj_control.screenShakeTimer     = _time
	obj_control.screenShakeMagnitude = _magnitude
}