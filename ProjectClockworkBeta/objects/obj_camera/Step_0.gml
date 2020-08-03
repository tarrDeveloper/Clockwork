// handling the camera
var _moveCam = false
if obj_player.x > x + camWidth/2 {
	x += camWidth
	_moveCam = true
}
if obj_player.x < x - camWidth/2 {
	x -= camWidth
	_moveCam = true
}
if obj_player.y < y - camHeight/2 {
	y -= camHeight
	_moveCam = true
}
if obj_player.y > y + camHeight/2 {
	y += camHeight
	_moveCam = true
}

if _moveCam { // moving the camera if the view changes
	camera_set_view_pos(view_camera[0],x-camWidth/2,y-camHeight/2)
}

// handling screenshake
if screenShakeTimer > 0 { // shaking the screen
	screenShakeTimer--
	var _mag = screenShakeMagnitude
	camera_set_view_pos(view_camera[0],x-camWidth/2+random_range(_mag,-_mag),y-camHeight/2+random_range(_mag,-_mag))
} else if screenShakeTimer != -1 { // setting the camera back to normal
	camera_set_view_pos(view_camera,x-camWidth/2,y-camHeight/2)
	screenShakeTimer = -1
	screenShakeMagnitude = 0
}