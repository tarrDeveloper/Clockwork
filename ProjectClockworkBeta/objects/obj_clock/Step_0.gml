// riding mechanics
if riding != noone {
	x = riding.x + ridingOffX
	y = riding.y + ridingOffY
}

// changing the velocity based on if the player is rewinding the clock
if obj_player.clockRewinding = self {
	valVel += valAcc
} else {
	valVel -= valDec
}

// applying the velocity to the value, then clamping the value
var _oldVal = val
val += valVel

if val < 0 || val > 1 {
	val = clamp(val,0,1)
	
	// visual -
	if _oldVal != 0 and _oldVal != 1 {
		screenShake(abs(valVel*60),abs(valVel*15))
	}
	// -
	
	valVel = 0
}

// checking if there is a place meeting, if there is make pressable
if place_meeting(x,y,obj_player) and obj_player.oldGrounded and obj_player.grounded {
	inRange = true
	buttonImage_index += 1/12
} else {
	inRange = false
}

// player interacting (making the player "stick" to the clock)
if inRange and obj_player.clockRewinding = noone {
	if keyboard_check_pressed(ord("J")) { // going into the clock state
		obj_player.clockRewinding = self
		obj_player.clockOffX = obj_player.x-x
		obj_player.clockOffY = obj_player.y-y
	}
}

// setting image_idnex based on val
image_index = round(val*16)