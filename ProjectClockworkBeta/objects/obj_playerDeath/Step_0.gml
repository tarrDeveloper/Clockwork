if !global.gamePaused {
	if animStart {
		// dampening the velocity
		velX = max(abs(velX)-dampX,0)*sign(velX)
		velY = max(abs(velY)-dampY,0)*sign(velY)

		x += velX
		y += velY
	
		t++
	}

	// decreasing the freeze timer
	if freezeTimer > 0 {
		freezeTimer--
	} else if freezeTimer = 0 {
		animStart = true
		screenShake(5,1)
		freezeTimer = -1
	}

	// destroying self and ending the animatino
	if t > 45 {
		if instance_exists(obj_checkpoint) {
			var _spawn = instance_create_layer(obj_checkpoint.x,obj_checkpoint.y,"Player",obj_playerSpawn)
			_spawn.image_xscale = image_xscale
		}
		instance_destroy()
	}
}