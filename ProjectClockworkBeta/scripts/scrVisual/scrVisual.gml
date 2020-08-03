// this function shakes the screen
function screenShake(_time,_magnitude) {
	obj_camera.screenShakeTimer = min(max(_time,obj_camera.screenShakeTimer),10)
	obj_camera.screenShakeMagnitude = min(max(_magnitude,obj_camera.screenShakeMagnitude),2)
}