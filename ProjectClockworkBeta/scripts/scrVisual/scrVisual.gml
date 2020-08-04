// this function shakes the screen
function screenShake(_time,_magnitude) {
	obj_control.screenShakeTimer     = min(max(_time,obj_control.screenShakeTimer),10)
	obj_control.screenShakeMagnitude = min(max(_magnitude,obj_control.screenShakeMagnitude),2)
}