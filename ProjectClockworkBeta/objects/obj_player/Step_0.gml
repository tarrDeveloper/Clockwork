if clockRewinding = noone { // normal state
	if riding != noone {
		ActorMoveX(riding.velX)
		ActorMoveY(riding.velY)
	}
	
	// moving the player first to recieve direct influence from moving solids
	ActorMoveX(velX+velXOff)
	velXOff = 0

	ActorMoveY(velY+velYOff)
	velYOff = 0

	// getting current player states
	grounded = checkOverlap(x,y+.1,obj_solid)

	// setting riding to noone if not grounded
	if !grounded {
		if riding != noone {
			velX += riding.velX
			//velY += riding.velY
		}
		riding = noone
	}
	
	/*// applying the rider property of the player
	if !grounded {
		if riding != noone { // stop riding and transfer velocity
			velX += riding.velX
			velY += riding.velY
			riding = noone
		}
	} else {
		if riding != noone {
			ActorMoveX(riding.velX)
			ActorMoveY(riding.velY)
		}
	}*/

	// getting the input
	var _hInp = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	var _jumpInp = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("K"))

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
		jumpTimer = 0
		velY = -jumpMag
		_jumped = true
	}

	// animation
	if grounded {
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
	if oldGrounded = noone and grounded != noone {
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

	oldGrounded = grounded
} else { // simply moving the player by the clock
	image_xscale = sign(clockRewinding.x+8-x)
	if image_xscale = 0 image_xscale = 1
	image_yscale = sign(image_yscale)
	sprite_index = spr_playerClockwork
	
	ActorMoveX(clockRewinding.x+clockOffX - x)
	ActorMoveY(clockRewinding.y+clockOffY - y)
	
	if !keyboard_check(ord("J")) { // exiting the clock state
		clockRewinding = noone
		clockOffX = 0
		clockOffY = 0
	} else {
		velX = 0
		velY = 0
	}
}