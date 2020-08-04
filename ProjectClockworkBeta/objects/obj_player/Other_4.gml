// spawning at checkpoint
if instance_exists(obj_control) and obj_control.devRoomChange = true {
	if instance_exists(obj_checkpoint) {
		x = obj_checkpoint.x
		y = obj_checkpoint.y
		velX = 0
		velY = 0
	}
	obj_control.devRoomChange = false
}