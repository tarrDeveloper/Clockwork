// switching rooms
if instance_exists(obj_player) {
	var _px = obj_player.x
	var _py = obj_player.y
	var _rmChange = false

	if _px > room_width-8+2 {
		mx += 1
		obj_player.x -= room_width-16
		_rmChange = true
	} else if _px < -2+8 {
		mx -= 1
		obj_player.x += room_width-16
		_rmChange = true
	} else if _py > room_height+2-2 {
		my -= 1
		obj_player.y -= room_height-4
		_rmChange = true
	} else if _py < 0 {
		my += 1
		obj_player.y += room_height-4
		_rmChange = true
	}

	if _rmChange {
		var _newRm = ds_grid_get(mapGrid,mx,my)
		if _newRm = undefined {
			show_message("FATAL: going to undefined room")
			game_end()
		} else {
			if _newRm = rm20Rewind and speedRunEnable { // setting the new high time
				timerTick = false
				var _time = (speedRunMinutes*3600)+(speedRunSeconds*60)+(speedRunMiliseconds)
				ini_open("speedrun.ini")
				var _bestTime = ini_read_real("times","best",0)
				if _time < _bestTime {
					ini_write_real("times","best",_time)
				}
				ini_close()
			}
			room_goto(_newRm)
		}
	}
}

// dev powers/ maybe player (going to next checkpoint)
if keyboard_check_pressed(ord("2")) {
	if room != rm20Rewind roomChanging = true
} else if keyboard_check_released(ord("2")) {
	roomChanging = false
}

if roomChanging {
	roomChangeTime += .5
} else {
	roomChangeTime = 0
}

if roomChangeTime >= 17 {
	if !instance_exists(obj_player) {
		instance_create_layer(x,y,"Player",obj_player)
	}
	var _room = room
	switch ds_map_find_value(mapList,_room) {
		case mpDir.right:
			mx++
			break
		case mpDir.left:
			mx--
			break
		case mpDir.up:
			my++
			break
		case mpDir.down:
			my--
			break
	}
	room_goto(ds_grid_get(mapGrid,mx,my))
	devRoomChange = true
	roomChanging = false
	roomChangeTime = 0
	// diabling speed run cause ya
	speedRunEnable = false
}

// if !instance_exists menu
// increasing speedRunTime
if speedRunEnable and timerTick {
	speedRunMiliseconds++
	if speedRunMiliseconds = 60 {
		speedRunSeconds++
		speedRunMiliseconds = 0
	}
	if speedRunSeconds = 60 {
		speedRunMinutes++
		speedRunSeconds = 0
	}
}

if speedRunEnable and !runStarted {
	if keyboard_check(ord("D")) ||
	   keyboard_check(ord("A")) ||
	   keyboard_check(ord("K")) {
			runStarted = true
			timerTick = true
	}
}