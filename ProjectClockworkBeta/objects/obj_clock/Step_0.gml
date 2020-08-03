// riding mechanics
if riding != noone {
	x = riding.x + ridingOffX
	y = riding.y + ridingOffY
}

// changing the val based on the player clock rewinding
if obj_player.clockRewinding = self {
	if val < 1 val += valInc
	if val > 1 val = 1
} else {
	if val > 0 val -= valDec
	if val < 0 val = 0
}

// checking if there is a place meeting, if there is make pressable
if place_meeting(x,y,obj_player) and obj_player.oldGrounded {
	inRange = true
	buttonImage_index += 1/12
} else {
	inRange = false
}

// player interacting
if inRange and obj_player.clockRewinding = noone {
	if keyboard_check_pressed(ord("J")) { // going into the clock state
		obj_player.clockRewinding = self
		obj_player.clockOffX = obj_player.x-x
		obj_player.clockOffY = obj_player.y-y
	}
}

// setting image_idnex based on val
image_index = round(val*16)