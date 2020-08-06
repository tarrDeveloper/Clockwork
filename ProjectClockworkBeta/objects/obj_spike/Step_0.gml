// changing the spike state
if myClock != noone {
	if spikeState < spikeStateTo {
		spikeState+=.2
	} else if spikeState > spikeStateTo {
		spikeState-=.2
	}

	// changeing the spikestateto
	if val < 1 {
		spikeStateTo = 0
	} else {
		spikeStateTo = 1
	}

	// changin the val
	oldVal = val
	if myClock.active {
		val+=inc
	} else {
		val-=dec
	}

	if val >= 1 {
		val = 1
		if oldVal != 1 {
			screenShake(3,1)
		}
	} else if val <= 0 {
		val = 0
		if oldVal != 0 {
			screenShake(3,1)
		}
	}

	// changing my position based on spike state
	x = xLock-8*spikeState*xDir
	y = yLock-8*spikeState*yDir
}