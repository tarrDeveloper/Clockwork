// changing the spike state
if myClock != noone {
	if spikeState < spikeStateTo {
		spikeState+=.2
	} else if spikeState > spikeStateTo {
		spikeState-=.2
	}

	// changeing the spikestateto
	if val = 0 {
		if spikeStateTo = 1 and mute = false {audio_play_sound(snd_spike,0,0)}
		spikeStateTo = 0
		deadly = true
	} else {
		if spikeStateTo = 0 and mute = false {audio_play_sound(snd_spike,0,0)}
		spikeStateTo = 1
		deadly = false
	}

	// changin the val
	oldVal = val
	if myClock.active {
		val+=inc
	} else {
		val+=dec
	}

	if val >= 10 {
		val = 10
		if oldVal != 10 {
			screenShake(3,1)
		}
	} else if val <= 0 {
		val = 0
		if oldVal != 0 {
			screenShake(3,1)
		}
	}

	// changing my position based on spike state
	x = xLock-9*abs(spikeState-inverse)*xDir
	y = yLock-9*abs(spikeState-inverse)*yDir

	// setting the clock positino to my position
	if mute = false myClock.image_index = 16*(val/10)
	
	// ticking
	if val != oldVal {
		tickTimer--
	} else {
		tickTimer = 1
	}
	
	if tickTimer <= 0 {
		audio_play_sound(snd_clockTick,2,0)
		tickTimer = 10
	}
} else {
	deadly = true
}