// moving to where I should be
SolidMove(velX,velY)

// changing my velocity
oldVelX = velX
oldVelY = velY

if myClock.active {	
	velX += accelX
	velY += accelY
} else {
	velX += deccelX
	velY += deccelY
}

// limiting velocities
if abs(velX) > velXMax {
	velX = sign(velX)*velXMax
}
if abs(velY) > velYMax {
	velY = sign(velY)*velYMax
}

var _xClamped = false
var _yClamped = false

// clamping my velocity
if x+velX <= xmin {velX = xmin-x;_xClamped = true}
if x+velX >= xmax {velX = xmax-x;_xClamped = true}
if y+velY <= ymin {velY = ymin-y;_yClamped = true}
if y+velY >= ymax {velY = ymax-y;_yClamped = true}

var _dist = point_distance(0,0,oldVelX,oldVelY)

// adding some sweet sweet screenshake
if (velX != 0 and (_xClamped)) {
	if !mute screenShake(_dist*2,_dist/8)
	latentVelX = oldVelX
	latentVelY = oldVelY
	latentTimer = 5
	
	// playing an end sound
	if !mute {
		audio_emitter_pitch(myAudioEmitter,.87)
		var _snd = audio_play_sound_on(myAudioEmitter,snd_gearEnd,false,1)
	}
} else if velY != 0 and _yClamped {
	if !mute screenShake(_dist*2,_dist/8)
	
	// playing an end sound
	if !mute {
		audio_emitter_pitch(myAudioEmitter,.87)
		var _snd = audio_play_sound_on(myAudioEmitter,snd_gearEnd,false,1)
	}
}

// make the gears turn
image_speed = _dist
if image_speed > 1 image_speed = 1

// handling latency
if latentTimer > 0 {
	latentTimer--
} else {
	latentVelX = velX
	latentVelY = velY
}

// setting the clock positino to my position
var _val = point_distance(xs,ys,x,y)/point_distance(xs,ys,xe,ye)
myClock.image_index = 16*_val

if !mute {
	var _tickDown = point_distance(0,0,velX,velY)/8
	if _tickDown > .2 _tickDown = .2

	// sound stuff
	if image_speed != 0 {
		if _tickDown < .01 _tickDown = .01
	} else {
		tickTimer = .1
	}

	tickTimer -= _tickDown
	if tickTimer <= 0 {
		tickTimer = 1
		audio_emitter_pitch(myAudioEmitter,random_range(.85,.9))
		audio_play_sound_on(myAudioEmitter,snd_gearTick,0,0)
	}
}