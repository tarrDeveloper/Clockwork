// riding mechanics
if riding != noone {
	x = riding.x + ridingOffX
	y = riding.y + ridingOffY
}

// changing the velocity based on if the player is rewinding the clock
if instance_exists(obj_player) and obj_player.clockRewinding = self {
	valVel += valAcc
} else {
	valVel -= valDec
}

// applying the velocity to the value, then clamping the value
//var _oldVal = val
valVel = round(valVel*100000)/100000
val += valVel

if val < 0 {
	val = 0
	valVel = 0
}

if val > 1 {
	val = 1
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
if inRange and instance_exists(obj_player) and obj_player.clockRewinding = noone {
	if keyboard_check(ord("J")) { // going into the clock state
		obj_player.clockRewinding = self
		obj_player.clockentrance = 5
		obj_player.clockOffX = obj_player.x-x
		obj_player.clockOffY = obj_player.y-y
	}
}

// setting image_idnex based on val
image_index = round(val*16)

// just rounding the val off bc/ i don't like when things break
val = round(val*10000)/10000