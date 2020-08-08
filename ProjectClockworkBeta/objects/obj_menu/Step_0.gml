if selected = -1 {
	if keyboard_check_pressed(ord("W")) {
		currentSelection--
	} else if keyboard_check_pressed(ord("S")) {
		currentSelection++
	}

	// looping
	if currentSelection > maxSelection currentSelection = 0
	if currentSelection < 0 currentSelection = maxSelection
	
	// selecting
	if keyboard_check_pressed(vk_enter) {
		selected = currentSelection
	}
} else {
	if selectTimer > 0 {
		if selectTimer > 15 {
			if selectTimer/3 = floor(selectTimer/3) {
				selectAlpha = abs(selectAlpha-1)
			}
		} else {
			selectAlpha = 1
		}
		selectTimer--
	} else {
		if selected = 0 {
			if room != rm20Rewind obj_control.timerTick = true
			global.gamePaused = false
			instance_destroy()
		} else {
			if instance_exists(obj_player) instance_destroy(obj_player)
			instance_destroy(obj_control)
			global.gamePaused = false
			room_goto(rmHome)
		}
		// do selection here
	}
}