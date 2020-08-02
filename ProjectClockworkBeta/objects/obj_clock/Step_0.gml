// gradually decreasing val if its more than 1
if val > 0 {
	val -= valDec
}

// checking if there is a place meeting, if there is make pressable
if place_meeting(x,y,obj_player) {
	inRange = true
	eImage_index += 1/12
	if eImage_index > 7 eImage_index = 0
} else {
	inRange = false
}

// player interacting
if inRange {
	if keyboard_check_pressed(ord("E")) {
		val = 1
	}
}

// setting image_idnex based on val
image_index = round(val*16)