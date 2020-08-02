// moving the player first to recieve direct influence from moving solids
ActorMoveX(velX+velXOff)
velXOff = 0

ActorMoveY(velY+velYOff)
velYOff = 0

// getting current player states
var _grounded = checkOverlap(x,y+.00001,obj_solid)

// applying the rider property of the player
if !_grounded {
	riding = noone
} else {
	if riding != noone {
		ActorMoveX(riding.velX)
		//ActorMoveY(riding.velY)
	}
}

// getting the input
var _hInp = keyboard_check(vk_right) - keyboard_check(vk_left)
var _jumpInp = keyboard_check_pressed(vk_space)

// accelerating or deccelerating the player
if _hInp != 0 {
	velX += accelX*_hInp
	if abs(velX) > accelXCap {
		velX = sign(velX)*accelXCap
	}
} else {
	if abs(velX) < deccelX {
		velX = 0
	} else {
		velX -= deccelX*sign(velX)
	}
}

// applying gravity to the player
velY += grav
if velY > gravYCap {
	velY = gravYCap
}

// making the player jump
if _jumpInp { // jump input buffer
	jumpTimer = 5
} else {
	if jumpTimer > 0 jumpTimer--
}

if !_grounded { // jump grace
	if jumpGrace > 0 jumpGrace--
} else {
	jumpGrace = 4
}

if jumpTimer > 0 and jumpGrace > 0 {
	jumpTimer = 0
	velY = -jumpMag
}

// animation
if _grounded {
	if _hInp = 0 {
		sprite_index = spr_playerIdle
	} else {
		sprite_index = spr_playerRun
	}
} else {
	sprite_index = spr_playerJump
}

if _hInp != 0 image_xscale = _hInp