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
			room_goto(_newRm)
		}
	}
}

// dev powers/ maybe player (going to next checkpoint)
if keyboard_check_pressed(ord("2")) {
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
}