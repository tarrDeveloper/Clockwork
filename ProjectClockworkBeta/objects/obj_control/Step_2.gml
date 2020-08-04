// switching rooms
var _px = obj_player.x
var _py = obj_player.y
var _rmChange = false

if _px > room_width+1 {
	mx += 1
	obj_player.x -= room_width
	_rmChange = true
} else if _px < -1 {
	mx -= 1
	obj_player.x += room_width
	_rmChange = true
} else if _py > 183 {
	my -= 1
	obj_player.y -= 180
	_rmChange = true
} else if _py < 1 {
	my += 1
	obj_player.y += 180
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