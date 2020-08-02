// moving the player first to recieve direct influence from moving solids
ActorMoveX(velX+velXOff)
velXOff = 0

ActorMoveY(velY+velYOff)
velYOff = 0

// getting current player states
var _grounded = checkOverlap(x,y+.1,obj_solid)

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
	jumpTimer = 10
} else {
	if jumpTimer > 0 jumpTimer--
}

if !(_grounded) or !(oldGrounded) { // jump grace
	if jumpGrace > 0 jumpGrace--
} else {
	jumpGrace = 7
}

var _jumped = false
if jumpTimer > 0 and jumpGrace > 0 {
	jumpTimer = 0
	velY = -jumpMag
	_jumped = true
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

if _hInp != 0 image_xscale = abs(image_xscale)*_hInp

// Squishing the player when they land
if oldGrounded = noone and _grounded != noone {
	image_xscale = sign(image_xscale)*1.4
	image_yscale = .8
}

// Squishing the player when they jump
if _jumped {
	image_xscale = sign(image_xscale)*.8
	image_yscale = 1.2
}

image_xscale = lerp(image_xscale,sign(image_xscale),.2)
image_yscale = lerp(image_yscale,sign(image_yscale),.2)

oldGrounded = _grounded