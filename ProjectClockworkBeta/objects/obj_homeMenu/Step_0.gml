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
	if keyboard_check_pressed(vk_enter) and currentSelection != 2 {
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
			room_goto(rm0Start)
		} else if selected = 1 {
			var _get = ds_list_find_value(menuItems,1)
			if _get = "Game Controls" {
				ds_list_set(menuItems,1,"Menu Controls")
				global.gameControls = true
			} else {
				ds_list_set(menuItems,1,"Game Controls")
				global.gameControls = false
			}
			selected = -1
			selectTimer = 45
		} else if selected = 3 {
			var _get = ds_list_find_value(menuItems,3)
			if _get = "Enable Speedrun" {
				ds_list_set(menuItems,3,"Disable Speedrun")
				global.speedRun = true
			} else {
				ds_list_set(menuItems,3,"Enable Speedrun")
				global.speedRun = false
			}
			selected = -1
			selectTimer = 45
		} else if selected = 4 {
			ini_open("speedrun.ini")
			ini_write_real("times","best",216000)
			ini_close()
			
			minuteString = "59"
			secondString = "00"
			miliString   = "00"
			
			selected = -1
			selectTimer = 45
		} else if selected = 5 {
			game_end()
		}
	}
}