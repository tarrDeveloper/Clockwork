if keyboard_check_pressed(vk_escape) { // pausoing
	if instance_exists(obj_menu) {
		instance_destroy(obj_menu)
		if speedRunEnable and room != rm20Rewind timerTick = true
	} else {
		instance_create_layer(160,90,"Player",obj_menu)
		timerTick = false
	}
	global.gamePaused = abs(1-global.gamePaused)
}