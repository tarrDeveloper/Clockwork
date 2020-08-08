if !global.gamePaused {
	// adusting flash time based on t
	if t/flashTime = round(t/flashTime) {
		image_alpha = abs(image_alpha-1)
	}

	// creating a player when the time is right
	if t = 32 {
		var _player = instance_create_layer(x,y,"Player",obj_player)
		_player.image_xscale = image_xscale
		instance_destroy()
	} else {
		t++
	}
}