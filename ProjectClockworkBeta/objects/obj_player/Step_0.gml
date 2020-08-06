// moving the player first to recieve direct influence from moving solids
ActorMoveX(velX+velXOff)
velXOff = 0

ActorMoveY(velY+velYOff)
velYOff = 0

// getting current player states
grounded = checkOverlap(x,y+.001,obj_solid)

// setting riding to noone if not grounded
if !grounded {
	riding = noone
}
	
// applying the riding to the player
if riding != noone and instance_exists(riding) {
	ActorMoveX(riding.oldVelX)
	//ActorMoveY(riding.oldVelY)
}

// getting the input
var _hInp = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * (clockRewinding = noone)
var _jumpInp = (keyboard_check_pressed(ord("K"))) * (clockRewinding = noone)

// applying horizontal accel to the player
var _deccelerated = false //keep track if the player already deccelerated
var _oldVelX = velX
	
velX += accelX*_hInp // acceleration
	
// making it so the player cant accelerate past a certain point on their own
if abs(_oldVelX) <= accelXCap and abs(velX) > accelXCap {
	velX = sign(velX)*accelXCap
}
	
// deccelerating the player in two ways (drag and not moving)
if abs(velX) > accelXCap {
	if abs(_oldVelX) < accelXCap {
		velX = sign(velX)*accelXCap
	} else {
		velX = _oldVelX
	}
	if !grounded { // deccelerating based on iff the player is grounded or not
		velX -= deccelX*sign(velX)/4
	} else {
		velX -= deccelX*sign(velX)
	}
	if sign(velX) = -sign(_oldVelX) velX = 0 // making it so the player can't deccelerate in the neg dir
	_deccelerated = true
}
	
if _hInp = 0 and !_deccelerated {
	velX -= deccelX*sign(velX)
	if sign(velX) = -sign(_oldVelX) velX = 0 // making it so the player can't deccelerate in the neg dir
}

// applying gravity to the player
velY += grav
if velY > gravYCap {
	velY = gravYCap
}

// making the player jump
if _jumpInp { // jump input buffer
	jumpTimer = 10
} else {
	if jumpTimer > 0 jumpTimer--
}

if !(grounded) or !(oldGrounded) { // jump grace
	if jumpGrace > 0 jumpGrace--
} else {
	jumpGrace = 7
}

var _jumped = false
if jumpTimer > 0 and jumpGrace > 0 {
	if -jumpMag < velY {
		jumpTimer = 0
		velY = -jumpMag
		_jumped = true
	
		if riding != noone and instance_exists(riding) { // applying accel when jumping
			velX += riding.latentVelX
			velY += riding.velY
		}
	}
}

if clockRewinding = noone {
	// animation
	if grounded {
		if _hInp = 0 {
			sprite_index = spr_playerIdle
			if velX = 0 footStepTimer = 1
			if velX = 0 dustTimer     = 1
		} else {
			sprite_index = spr_playerRun
			if !oldGrounded {
				image_index = 1
			}
			footStepTimer--
			dustTimer--
		}
	} else {
		sprite_index = spr_playerJump
		footStepTimer = footStepTimerMax
		dustTimer = 1
	}

	if _hInp != 0 image_xscale = abs(image_xscale)*_hInp

	// Squishing the player when they land
	if oldGrounded = noone and grounded != noone {
		image_xscale = sign(image_xscale)*1.4
		image_yscale = .8
		// particles
		part_particles_create(obj_partSystem.partSystem,x+4,y+10,obj_partSystem.partDust,1)
		part_particles_create(obj_partSystem.partSystem,x-4,y+10,obj_partSystem.partDust,1)
		// landing sound
		var _ft = audio_play_sound(footStepSound,0,0)
		audio_sound_gain(_ft,1,0)
	}

	// Squishing the player when they jump
	if _jumped {
		image_xscale = sign(image_xscale)*.8
		image_yscale = 1.2
		audio_play_sound(snd_jump,0,0)
	}

	image_xscale = lerp(image_xscale,sign(image_xscale),.2)
	image_yscale = lerp(image_yscale,sign(image_yscale),.2)
}

// particles
if dustTimer <= 0 {
	part_particles_create(obj_partSystem.partSystem,xprevious,yprevious+10,obj_partSystem.partDust,1)
	dustTimer = irandom_range(1,dustTimerMax)+1
}

// audio
if footStepTimer <= 0 {
	var _ft = audio_play_sound(footStepSound,0,0)
	audio_sound_gain(_ft,1,0)
	audio_sound_pitch(_ft,choose(1,1.05))
	footStepTimer = footStepTimerMax
}

oldGrounded = grounded

// colliding with a hazard and dying
var _death = place_meeting(x,y,obj_death)
if _death {
	playerDeath()
}